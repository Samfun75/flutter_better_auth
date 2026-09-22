import 'dart:async';

import 'package:cookie_jar/cookie_jar.dart';

import 'custom_persist_cookie_jar.dart';

/// One operation at a time: the parent's unlocked read-merge-write lets concurrent Set-Cookies drop each other.
class SerializedPersistCookieJar extends CustomPersistCookieJar {
  SerializedPersistCookieJar({required super.store, required super.storage});

  Future<void> _tail = Future<void>.value();

  Future<T> _serialized<T>(Future<T> Function() operation) {
    final result = _tail.then((_) => operation());
    _tail = result.then<void>((_) {}, onError: (_) {});
    return result;
  }

  @override
  Future<void> saveFromResponse(Uri uri, List<Cookie> cookies) =>
      _serialized(() => super.saveFromResponse(uri, cookies));

  @override
  Future<List<Cookie>> loadForRequest(Uri uri) =>
      _serialized(() => super.loadForRequest(uri));

  @override
  Future<void> clearFor(Uri uri) => _serialized(() => super.clearFor(uri));
}
