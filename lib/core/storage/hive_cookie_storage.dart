import 'package:cookie_jar/cookie_jar.dart';
import 'package:hive/hive.dart';

/// Persists `cookie_jar`'s serialized state in the `better_auth_cookies` box.
///
/// Used as the [Storage] behind [PersistCookieJar], which owns all cookie
/// semantics (merge by name+domain+path, Max-Age/Expires handling, expiry
/// eviction). This class is deliberately a dumb key-value adapter.
class HiveCookieStorage implements Storage {
  Box get _box => Hive.box('better_auth_cookies');

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {}

  @override
  Future<String?> read(String key) async => _box.get(key) as String?;

  @override
  Future<void> write(String key, String value) => _box.put(key, value);

  @override
  Future<void> delete(String key) => _box.delete(key);

  @override
  Future<void> deleteAll(List<String> keys) async {
    // The box holds nothing but cookie state, so clearing it outright also
    // removes stale index/domain entries cookie_jar may no longer track.
    await _box.clear();
  }
}
