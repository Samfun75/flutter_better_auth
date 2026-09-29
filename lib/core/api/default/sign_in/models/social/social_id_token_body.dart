import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_id_token_body.freezed.dart';

part 'social_id_token_body.g.dart';

@freezed
abstract class SocialIdTokenBody with _$SocialIdTokenBody {
  const factory SocialIdTokenBody({
    required String token,
    String? nonce,
    String? accessToken,
    String? refreshToken,
    int? expiresAt,
    SocialIdTokenUser? user,
  }) = _SocialIdTokenBody;

  factory SocialIdTokenBody.fromJson(Map<String, dynamic> json) =>
      _$SocialIdTokenBodyFromJson(json);
}

/// Apple sends the name only on first authorization and never in the ID token.
@freezed
abstract class SocialIdTokenUser with _$SocialIdTokenUser {
  const factory SocialIdTokenUser({
    SocialIdTokenUserName? name,
    String? email,
  }) = _SocialIdTokenUser;

  factory SocialIdTokenUser.fromJson(Map<String, dynamic> json) =>
      _$SocialIdTokenUserFromJson(json);
}

@freezed
abstract class SocialIdTokenUserName with _$SocialIdTokenUserName {
  const factory SocialIdTokenUserName({String? firstName, String? lastName}) =
      _SocialIdTokenUserName;

  factory SocialIdTokenUserName.fromJson(Map<String, dynamic> json) =>
      _$SocialIdTokenUserNameFromJson(json);
}
