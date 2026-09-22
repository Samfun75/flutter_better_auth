import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter_better_auth/core/storage/custom_persist_cookie_jar.dart';
import 'package:flutter_better_auth/core/storage/memory_storage.dart';
import 'package:flutter_better_auth/core/storage/serialized_persist_cookie_jar.dart';
import 'package:flutter_better_auth/core/storage/storage.dart';
import 'package:flutter_test/flutter_test.dart';

const _sessionName = 'better-auth.session_token';
final _uri = Uri.parse('https://example.com/api/auth/get-session');

Cookie _cookie(String name, String value) => Cookie(name, value)..path = '/';

/// Parks every [loadCookies] call until [release] so tests choose the interleaving.
class GatedCookieStorage implements StorageInterface {
  final Map<String, List<Cookie>> cookiesByHost = {};
  final List<Completer<void>> _parked = [];
  bool gated = true;

  int get parked => _parked.length;

  Future<void> release({bool reverse = false}) async {
    gated = false;
    final waiting = reverse ? _parked.reversed.toList() : List.of(_parked);
    _parked.clear();
    for (final completer in waiting) {
      completer.complete();
      await pumpEventQueue();
    }
  }

  Set<String> get persistedNames => {
    for (final cookie in cookiesByHost[_uri.host] ?? const <Cookie>[])
      cookie.name,
  };

  @override
  Future<List<Cookie>> loadCookies(String url) async {
    final snapshot = List.of(cookiesByHost[url] ?? const <Cookie>[]);
    if (gated) {
      final completer = Completer<void>();
      _parked.add(completer);
      await completer.future;
    }
    return snapshot;
  }

  @override
  Future<void> saveCookies(String url, List<Cookie> cookies) async {
    cookiesByHost[url] = List.of(cookies);
  }
}

/// Every call waits 0–3 ms, like a flutter_secure_storage platform round trip.
class LatencyCookieStorage implements StorageInterface {
  LatencyCookieStorage(this._random);

  final Random _random;
  final Map<String, List<Cookie>> _cookiesByHost = {};

  Future<void> _hop() =>
      Future<void>.delayed(Duration(microseconds: _random.nextInt(3000)));

  @override
  Future<List<Cookie>> loadCookies(String url) async {
    await _hop();
    return List.of(_cookiesByHost[url] ?? const []);
  }

  @override
  Future<void> saveCookies(String url, List<Cookie> cookies) async {
    await _hop();
    _cookiesByHost[url] = List.of(cookies);
  }
}

typedef JarFactory = CustomPersistCookieJar Function(StorageInterface store);

CustomPersistCookieJar _unserialized(StorageInterface store) =>
    CustomPersistCookieJar(store: store, storage: MemoryStorage());

CustomPersistCookieJar _serialized(StorageInterface store) =>
    SerializedPersistCookieJar(store: store, storage: MemoryStorage());

Future<Set<String>> _concurrentSetCookies(JarFactory makeJar) async {
  final store = GatedCookieStorage();
  final jar = makeJar(store);

  final writes = Future.wait([
    jar.saveFromResponse(_uri, [_cookie(_sessionName, 'token')]),
    jar.saveFromResponse(_uri, [_cookie('cookiesession1', 'node-a')]),
  ]);
  await pumpEventQueue();
  await store.release();
  await writes;

  return store.persistedNames;
}

Future<String?> _tokenRotatedDuringRequest(JarFactory makeJar) async {
  final store = GatedCookieStorage()
    ..cookiesByHost[_uri.host] = [
      _cookie(_sessionName, 'old'),
      _cookie('better-auth.session_data', 'cache')
        ..expires = DateTime.now().subtract(const Duration(seconds: 1)),
    ];
  final jar = makeJar(store);

  final request = jar.loadForRequest(_uri);
  final rotation = jar.saveFromResponse(_uri, [_cookie(_sessionName, 'new')]);
  await pumpEventQueue();
  // The rotation's write lands first; an unlocked request then writes back its stale snapshot.
  await store.release(reverse: true);
  await Future.wait([request, rotation]);

  return store.cookiesByHost[_uri.host]
      ?.where((c) => c.name == _sessionName)
      .firstOrNull
      ?.value;
}

void main() {
  group('SerializedPersistCookieJar', () {
    test(
      'keeps both cookies when two responses set cookies concurrently',
      () async {
        expect(await _concurrentSetCookies(_serialized), {
          _sessionName,
          'cookiesession1',
        });
      },
    );

    test(
      'keeps a session token rotated while a request is in flight',
      () async {
        expect(await _tokenRotatedDuringRequest(_serialized), 'new');
      },
    );

    test('runs one store operation at a time', () async {
      final store = GatedCookieStorage();
      final jar = _serialized(store);

      final writes = Future.wait([
        jar.saveFromResponse(_uri, [_cookie(_sessionName, 'token')]),
        jar.loadForRequest(_uri),
        jar.saveFromResponse(_uri, [_cookie('cookiesession1', 'node')]),
      ]);
      await pumpEventQueue();

      expect(store.parked, 1);
      await store.release();
      await writes;
    });

    test('sign-out clears cookies saved by in-flight responses', () async {
      final store = GatedCookieStorage()..gated = false;
      final jar = _serialized(store);
      await jar.saveFromResponse(_uri, [_cookie(_sessionName, 'token')]);

      await Future.wait([
        jar.saveFromResponse(_uri, [_cookie('cookiesession1', 'node')]),
        jar.clearFor(_uri),
      ]);

      expect(await jar.loadForRequest(_uri), isEmpty);
    });

    test(
      'parallel requests during Set-Cookie responses never lose the session',
      () async {
        final random = Random(42);
        var requests = 0;
        var missingSession = 0;
        var lostOnDisk = 0;

        for (var round = 0; round < 100; round++) {
          final store = LatencyCookieStorage(random);
          final jar = _serialized(store);
          await jar.saveFromResponse(_uri, [_cookie(_sessionName, 'token')]);

          Future<T> staggered<T>(Future<T> Function() call) =>
              Future<void>.delayed(
                Duration(microseconds: random.nextInt(2000)),
              ).then((_) => call());

          final loads = [
            for (var i = 0; i < 8; i++)
              staggered(() => jar.loadForRequest(_uri)),
          ];
          final stickyCookie = staggered(
            () => jar.saveFromResponse(_uri, [
              _cookie('cookiesession1', 'node-$round'),
            ]),
          );

          final results = await Future.wait(loads);
          await stickyCookie;
          requests += results.length;
          missingSession += results
              .where((cookies) => !cookies.any((c) => c.name == _sessionName))
              .length;

          final afterRestart = await _unserialized(store).loadForRequest(_uri);
          if (!afterRestart.any((c) => c.name == _sessionName)) lostOnDisk++;
        }

        expect(requests, 800);
        expect(missingSession, 0);
        expect(lostOnDisk, 0);
      },
    );
  });

  // When upstream makes CustomPersistCookieJar safe these start failing: then drop SerializedPersistCookieJar.
  group('CustomPersistCookieJar without serialization', () {
    test(
      'still drops a cookie when two responses set cookies concurrently',
      () async {
        expect(await _concurrentSetCookies(_unserialized), hasLength(1));
      },
    );

    test('still overwrites a session token rotated during a request', () async {
      expect(await _tokenRotatedDuringRequest(_unserialized), 'old');
    });
  });
}
