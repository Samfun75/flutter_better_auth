// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_id_token_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialIdTokenBody _$SocialIdTokenBodyFromJson(Map<String, dynamic> json) =>
    _SocialIdTokenBody(
      token: json['token'] as String,
      nonce: json['nonce'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expiresAt: (json['expiresAt'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : SocialIdTokenUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SocialIdTokenBodyToJson(_SocialIdTokenBody instance) =>
    <String, dynamic>{
      'token': instance.token,
      'nonce': instance.nonce,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresAt': instance.expiresAt,
      'user': instance.user?.toJson(),
    };

_SocialIdTokenUser _$SocialIdTokenUserFromJson(Map<String, dynamic> json) =>
    _SocialIdTokenUser(
      name: json['name'] == null
          ? null
          : SocialIdTokenUserName.fromJson(
              json['name'] as Map<String, dynamic>,
            ),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$SocialIdTokenUserToJson(_SocialIdTokenUser instance) =>
    <String, dynamic>{'name': instance.name?.toJson(), 'email': instance.email};

_SocialIdTokenUserName _$SocialIdTokenUserNameFromJson(
  Map<String, dynamic> json,
) => _SocialIdTokenUserName(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
);

Map<String, dynamic> _$SocialIdTokenUserNameToJson(
  _SocialIdTokenUserName instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
