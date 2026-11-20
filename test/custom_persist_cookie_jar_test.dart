import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_better_auth/core/storage/custom_persist_cookie_jar.dart';
import 'package:flutter_better_auth/core/storage/memory_storage.dart';
import 'package:flutter_better_auth/core/storage/storage.dart';
import 'package:flutter_test/flutter_test.dart';

class InMemoryCookieStorage implements StorageInterface {
  final Map<String, List<Cookie>> cookiesByHost = {};

  @override
  Future<List<Cookie>> loadCookies(String url) async =>
      List.of(cookiesByHost[url] ?? const []);

  @override
  Future<void> saveCookies(String url, List<Cookie> cookies) async {
    cookiesByHost[url] = List.of(cookies);
  }
}

class UnavailableCookieStorage implements StorageInterface {
  static const _failure = CookieStoreUnavailable('KeyStoreException');

  @override
  Future<List<Cookie>> loadCookies(String url) async => throw _failure;

  @override
  Future<void> saveCookies(String url, List<Cookie> cookies) async =>
      throw _failure;
}

/// Sets a session cookie on every response and records the Cookie header of each request.
class SessionServer implements HttpClientAdapter {
  final sentCookies = <String?>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    sentCookies.add(options.headers[HttpHeaders.cookieHeader] as String?);
    return ResponseBody.fromString(
      '{}',
      200,
      headers: {
        HttpHeaders.setCookieHeader: ['session_token=token; Path=/'],
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  group('CustomPersistCookieJar', () {
    final uri = Uri.parse('https://example.com/api/auth');

    test('merges cookies received in separate responses', () async {
      final storage = InMemoryCookieStorage();
      final jar = CustomPersistCookieJar(
        store: storage,
        storage: MemoryStorage(),
      );

      await jar.saveFromResponse(uri, [Cookie('oauth_state', 'state')]);
      await jar.saveFromResponse(uri, [Cookie('session_token', 'token')]);

      final cookies = await jar.loadForRequest(uri);

      expect(
        {for (final cookie in cookies) cookie.name: cookie.value},
        {'oauth_state': 'state', 'session_token': 'token'},
      );
    });

    test('removes cookies expired by the server', () async {
      final storage = InMemoryCookieStorage();
      final jar = CustomPersistCookieJar(
        store: storage,
        storage: MemoryStorage(),
      );

      await jar.saveFromResponse(uri, [Cookie('session_token', 'token')]);
      await jar.saveFromResponse(uri, [
        Cookie('session_token', '')..maxAge = 0,
      ]);

      expect(await jar.loadForRequest(uri), isEmpty);
    });

    test(
      'does not send persisted cookies outside their request path',
      () async {
        final storage = InMemoryCookieStorage();
        final jar = CustomPersistCookieJar(
          store: storage,
          storage: MemoryStorage(),
        );

        await jar.saveFromResponse(uri, [
          Cookie('admin_session', 'token')..path = '/admin',
        ]);

        expect(await jar.loadForRequest(uri), isEmpty);
      },
    );
  });

  group('CustomPersistCookieJar with an unusable platform store', () {
    final uri = Uri.parse('https://example.com/api/auth');
    late CustomPersistCookieJar jar;

    setUp(() {
      jar = CustomPersistCookieJar(
        store: UnavailableCookieStorage(),
        storage: MemoryStorage(),
      );
    });

    test('keeps the session in memory for the life of the process', () async {
      await jar.saveFromResponse(uri, [Cookie('session_token', 'token')]);

      final cookies = await jar.loadForRequest(uri);

      expect(cookies.single.value, 'token');
    });

    test('signing out still clears the session', () async {
      await jar.saveFromResponse(uri, [Cookie('session_token', 'token')]);

      await jar.clearFor(uri);

      expect(await jar.loadForRequest(uri), isEmpty);
    });

    test(
      'requests still go out, and carry the session once it is set',
      () async {
        final server = SessionServer();
        final dio = Dio(BaseOptions(baseUrl: 'https://example.com/api/auth'))
          ..httpClientAdapter = server
          ..interceptors.add(CookieManager(jar));

        await dio.post<void>('/sign-in/email');
        await dio.get<void>('/get-session');

        expect(server.sentCookies, [null, 'session_token=token']);
      },
    );
  });
}
