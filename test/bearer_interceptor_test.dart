import 'package:dio/dio.dart';
import 'package:flutter_better_auth/core/api/bearer_interceptor.dart';
import 'package:flutter_better_auth/core/flutter_better_auth.dart';
import 'package:flutter_test/flutter_test.dart';

class _H extends ResponseInterceptorHandler {
  @override
  void next(Response response) {}
}

class _RequestH extends RequestInterceptorHandler {
  @override
  void next(RequestOptions requestOptions) {}
}

Response _res(String path, Object? data, [Map<String, List<String>>? h]) =>
    Response(
      requestOptions: RequestOptions(path: path),
      data: data,
      headers: Headers.fromMap(h ?? {}),
    );

void main() {
  tearDown(() => FlutterBetterAuth.setBearerToken(null));

  test('takes the token from the sign-in body when no header is sent', () {
    BearerTokenInterceptor().onResponse(_res('/sign-in/email', {'token': 'abc'}), _H());
    expect(FlutterBetterAuth.bearerToken, 'abc');
  });

  test('header wins over body; other paths ignore the body', () {
    final i = BearerTokenInterceptor();
    i.onResponse(_res('/sign-in/email', {'token': 'body'}, {'set-auth-token': ['hdr']}), _H());
    expect(FlutterBetterAuth.bearerToken, 'hdr');
    FlutterBetterAuth.setBearerToken(null);
    i.onResponse(_res('/get-session', {'token': 'x'}), _H());
    expect(FlutterBetterAuth.bearerToken, isNull);
  });

  test('attaches the token when nothing else set Authorization', () {
    FlutterBetterAuth.setBearerToken('session');
    final options = RequestOptions(path: '/get-session');

    BearerTokenInterceptor().onRequest(options, _RequestH());

    expect(options.headers['Authorization'], 'Bearer session');
  });

  test('leaves an Authorization header an earlier interceptor set', () {
    FlutterBetterAuth.setBearerToken('session');
    final options = RequestOptions(
      path: '/get-session',
      headers: {'authorization': 'Bearer gateway'},
    );

    BearerTokenInterceptor().onRequest(options, _RequestH());

    expect(options.headers['Authorization'], 'Bearer gateway');
  });
}
