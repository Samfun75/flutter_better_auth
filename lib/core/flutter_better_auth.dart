import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_better_auth/core/api/better_auth_client.dart';
import 'package:flutter_better_auth/core/storage/hive_cookie_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'api/interceptor.dart';

class FlutterBetterAuth {
  static final FlutterBetterAuth _instance = FlutterBetterAuth._internal();
  late final BetterAuthClient _client;
  static bool _initialized = false;

  static late String baseUrl;
  static late final Dio dioClient;

  static late final PersistCookieJar cookieJar;
  static bool _hasCookieJar = false;

  static bool get hasCookieJar => _hasCookieJar;

  FlutterBetterAuth._internal() {
    _client = BetterAuthClient(dioClient, baseUrl: baseUrl);
  }

  static Future<void> initialize({
    required String url,
    Dio? dio,
    Storage? cookieStorage,
  }) async {
    if (_initialized) return;
    baseUrl = url;
    dioClient =
        dio ??
        Dio(
          BaseOptions(
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.userAgentHeader: 'FlutterBetterAuth/1.0.0',
              'flutter-origin': 'flutter://',
              'expo-origin': 'exp://',
              'x-skip-oauth-proxy': true,
            },
            validateStatus: (status) => status != null && status < 300,
          ),
        );

    if (cookieStorage == null && !kIsWeb) {
      cookieStorage = await _initHiveCookieStorage();
    }
    if (cookieStorage != null) {
      cookieJar = PersistCookieJar(storage: cookieStorage);
      _hasCookieJar = true;
      dioClient.interceptors.add(CookieManager(cookieJar));
    }
    dioClient.interceptors.add(RemoveNullsInterceptor());
    _initialized = true;
  }

  /// Deletes every persisted cookie (e.g. on sign-out). No-op when no cookie
  /// jar was set up (web without an explicit storage).
  static Future<void> clearCookies() async {
    if (!_hasCookieJar) return;
    await cookieJar.deleteAll();
  }

  static Future<HiveCookieStorage> _initHiveCookieStorage() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    final box = await Hive.openBox('better_auth_cookies');

    final legacyKeys = box.keys.where((k) => box.get(k) is! String).toList();
    if (legacyKeys.isNotEmpty) {
      await box.deleteAll(legacyKeys);
    }
    return HiveCookieStorage();
  }

  static BetterAuthClient get client {
    assert(
      _initialized,
      'FlutterBetterAuth not initialized. Call initialize() first.',
    );
    return _instance._client;
  }
}
