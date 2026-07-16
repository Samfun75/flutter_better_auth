import 'package:cookie_jar/cookie_jar.dart';

/// In-memory cookie persistence for tests (avoids Hive / path_provider).
class FakeCookieStorage implements Storage {
  final Map<String, String> data = {};

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {}

  @override
  Future<String?> read(String key) async => data[key];

  @override
  Future<void> write(String key, String value) async {
    data[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    data.remove(key);
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    data.clear();
  }
}
