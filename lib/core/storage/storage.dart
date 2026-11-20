import 'package:cookie_jar/cookie_jar.dart';

abstract class StorageInterface {
  static late final String basePath;
  Future<void> saveCookies(String url, List<Cookie> cookies);
  Future<List<Cookie>> loadCookies(String url);
}

/// The platform store cannot be used at all, for example when the Android Keystore fails to create its key.
class CookieStoreUnavailable implements Exception {
  const CookieStoreUnavailable(this.cause);

  final Object cause;

  @override
  String toString() => 'CookieStoreUnavailable: $cause';
}
