import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_cookie_storage.dart';

/// Regression tests for the cookie handling that used to live in
/// CustomPersistCookieJar/HiveStorage, which replaced the whole per-host
/// cookie list on every response — an unrelated Set-Cookie (e.g. a gateway's
/// sticky-session cookie) wiped the Better Auth session token.
void main() {
  final uri = Uri.parse('http://localhost/api/auth');

  Cookie sessionToken({int maxAge = 604800}) =>
      Cookie.fromSetCookieValue(
        '__Secure-better-auth.session_token=abc123; Max-Age=$maxAge; '
        'Path=/; HttpOnly; Secure; SameSite=Lax',
      );

  Cookie gatewayCookie() => Cookie.fromSetCookieValue(
    'cookiesession1=678B288D; '
    'Expires=Fri, 16 Jul 2027 07:56:08 GMT; Path=/; HttpOnly',
  );

  group('PersistCookieJar over FakeCookieStorage', () {
    test('unrelated Set-Cookie does not wipe existing cookies', () async {
      final jar = PersistCookieJar(storage: FakeCookieStorage());

      await jar.saveFromResponse(uri, [sessionToken()]);
      await jar.saveFromResponse(uri, [gatewayCookie()]);

      final names =
          (await jar.loadForRequest(uri)).map((c) => c.name).toSet();
      expect(names, containsAll(['__Secure-better-auth.session_token',
          'cookiesession1']));
    });

    test('cookies survive a restart (new jar over same storage)', () async {
      final storage = FakeCookieStorage();

      await PersistCookieJar(storage: storage)
          .saveFromResponse(uri, [sessionToken()]);

      // Simulates an app restart: fresh jar, same persisted state. Also
      // covers Max-Age-only cookies, whose expiry the old Hive serializer
      // dropped entirely.
      final revived = PersistCookieJar(storage: storage);
      final names =
          (await revived.loadForRequest(uri)).map((c) => c.name).toSet();
      expect(names, contains('__Secure-better-auth.session_token'));
    });

    test('Max-Age=0 Set-Cookie deletes the cookie (sign-out)', () async {
      final jar = PersistCookieJar(storage: FakeCookieStorage());

      await jar.saveFromResponse(uri, [sessionToken()]);
      await jar.saveFromResponse(uri, [sessionToken(maxAge: 0)]);

      final names =
          (await jar.loadForRequest(uri)).map((c) => c.name).toSet();
      expect(names, isNot(contains('__Secure-better-auth.session_token')));
    });

    test('deleteAll clears everything (clearCookies)', () async {
      final storage = FakeCookieStorage();
      final jar = PersistCookieJar(storage: storage);

      await jar.saveFromResponse(uri, [sessionToken(), gatewayCookie()]);
      await jar.deleteAll();

      expect(await jar.loadForRequest(uri), isEmpty);
      expect(storage.data, isEmpty);
    });
  });
}
