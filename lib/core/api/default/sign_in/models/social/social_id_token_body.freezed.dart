// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_id_token_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialIdTokenBody {

 String get token; String? get nonce; String? get accessToken; String? get refreshToken; int? get expiresAt; SocialIdTokenUser? get user;
/// Create a copy of SocialIdTokenBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialIdTokenBodyCopyWith<SocialIdTokenBody> get copyWith => _$SocialIdTokenBodyCopyWithImpl<SocialIdTokenBody>(this as SocialIdTokenBody, _$identity);

  /// Serializes this SocialIdTokenBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialIdTokenBody&&(identical(other.token, token) || other.token == token)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,nonce,accessToken,refreshToken,expiresAt,user);

@override
String toString() {
  return 'SocialIdTokenBody(token: $token, nonce: $nonce, accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt, user: $user)';
}


}

/// @nodoc
abstract mixin class $SocialIdTokenBodyCopyWith<$Res>  {
  factory $SocialIdTokenBodyCopyWith(SocialIdTokenBody value, $Res Function(SocialIdTokenBody) _then) = _$SocialIdTokenBodyCopyWithImpl;
@useResult
$Res call({
 String token, String? nonce, String? accessToken, String? refreshToken, int? expiresAt, SocialIdTokenUser? user
});


$SocialIdTokenUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$SocialIdTokenBodyCopyWithImpl<$Res>
    implements $SocialIdTokenBodyCopyWith<$Res> {
  _$SocialIdTokenBodyCopyWithImpl(this._self, this._then);

  final SocialIdTokenBody _self;
  final $Res Function(SocialIdTokenBody) _then;

/// Create a copy of SocialIdTokenBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? nonce = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,Object? expiresAt = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,nonce: freezed == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SocialIdTokenUser?,
  ));
}
/// Create a copy of SocialIdTokenBody
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SocialIdTokenUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $SocialIdTokenUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [SocialIdTokenBody].
extension SocialIdTokenBodyPatterns on SocialIdTokenBody {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialIdTokenBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialIdTokenBody() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialIdTokenBody value)  $default,){
final _that = this;
switch (_that) {
case _SocialIdTokenBody():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialIdTokenBody value)?  $default,){
final _that = this;
switch (_that) {
case _SocialIdTokenBody() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String? nonce,  String? accessToken,  String? refreshToken,  int? expiresAt,  SocialIdTokenUser? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialIdTokenBody() when $default != null:
return $default(_that.token,_that.nonce,_that.accessToken,_that.refreshToken,_that.expiresAt,_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String? nonce,  String? accessToken,  String? refreshToken,  int? expiresAt,  SocialIdTokenUser? user)  $default,) {final _that = this;
switch (_that) {
case _SocialIdTokenBody():
return $default(_that.token,_that.nonce,_that.accessToken,_that.refreshToken,_that.expiresAt,_that.user);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String? nonce,  String? accessToken,  String? refreshToken,  int? expiresAt,  SocialIdTokenUser? user)?  $default,) {final _that = this;
switch (_that) {
case _SocialIdTokenBody() when $default != null:
return $default(_that.token,_that.nonce,_that.accessToken,_that.refreshToken,_that.expiresAt,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialIdTokenBody implements SocialIdTokenBody {
  const _SocialIdTokenBody({required this.token, this.nonce, this.accessToken, this.refreshToken, this.expiresAt, this.user});
  factory _SocialIdTokenBody.fromJson(Map<String, dynamic> json) => _$SocialIdTokenBodyFromJson(json);

@override final  String token;
@override final  String? nonce;
@override final  String? accessToken;
@override final  String? refreshToken;
@override final  int? expiresAt;
@override final  SocialIdTokenUser? user;

/// Create a copy of SocialIdTokenBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialIdTokenBodyCopyWith<_SocialIdTokenBody> get copyWith => __$SocialIdTokenBodyCopyWithImpl<_SocialIdTokenBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialIdTokenBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialIdTokenBody&&(identical(other.token, token) || other.token == token)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,nonce,accessToken,refreshToken,expiresAt,user);

@override
String toString() {
  return 'SocialIdTokenBody(token: $token, nonce: $nonce, accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$SocialIdTokenBodyCopyWith<$Res> implements $SocialIdTokenBodyCopyWith<$Res> {
  factory _$SocialIdTokenBodyCopyWith(_SocialIdTokenBody value, $Res Function(_SocialIdTokenBody) _then) = __$SocialIdTokenBodyCopyWithImpl;
@override @useResult
$Res call({
 String token, String? nonce, String? accessToken, String? refreshToken, int? expiresAt, SocialIdTokenUser? user
});


@override $SocialIdTokenUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$SocialIdTokenBodyCopyWithImpl<$Res>
    implements _$SocialIdTokenBodyCopyWith<$Res> {
  __$SocialIdTokenBodyCopyWithImpl(this._self, this._then);

  final _SocialIdTokenBody _self;
  final $Res Function(_SocialIdTokenBody) _then;

/// Create a copy of SocialIdTokenBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? nonce = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,Object? expiresAt = freezed,Object? user = freezed,}) {
  return _then(_SocialIdTokenBody(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,nonce: freezed == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as SocialIdTokenUser?,
  ));
}

/// Create a copy of SocialIdTokenBody
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SocialIdTokenUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $SocialIdTokenUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$SocialIdTokenUser {

 SocialIdTokenUserName? get name; String? get email;
/// Create a copy of SocialIdTokenUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialIdTokenUserCopyWith<SocialIdTokenUser> get copyWith => _$SocialIdTokenUserCopyWithImpl<SocialIdTokenUser>(this as SocialIdTokenUser, _$identity);

  /// Serializes this SocialIdTokenUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialIdTokenUser&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'SocialIdTokenUser(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $SocialIdTokenUserCopyWith<$Res>  {
  factory $SocialIdTokenUserCopyWith(SocialIdTokenUser value, $Res Function(SocialIdTokenUser) _then) = _$SocialIdTokenUserCopyWithImpl;
@useResult
$Res call({
 SocialIdTokenUserName? name, String? email
});


$SocialIdTokenUserNameCopyWith<$Res>? get name;

}
/// @nodoc
class _$SocialIdTokenUserCopyWithImpl<$Res>
    implements $SocialIdTokenUserCopyWith<$Res> {
  _$SocialIdTokenUserCopyWithImpl(this._self, this._then);

  final SocialIdTokenUser _self;
  final $Res Function(SocialIdTokenUser) _then;

/// Create a copy of SocialIdTokenUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as SocialIdTokenUserName?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SocialIdTokenUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SocialIdTokenUserNameCopyWith<$Res>? get name {
    if (_self.name == null) {
    return null;
  }

  return $SocialIdTokenUserNameCopyWith<$Res>(_self.name!, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// Adds pattern-matching-related methods to [SocialIdTokenUser].
extension SocialIdTokenUserPatterns on SocialIdTokenUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialIdTokenUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialIdTokenUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialIdTokenUser value)  $default,){
final _that = this;
switch (_that) {
case _SocialIdTokenUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialIdTokenUser value)?  $default,){
final _that = this;
switch (_that) {
case _SocialIdTokenUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SocialIdTokenUserName? name,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialIdTokenUser() when $default != null:
return $default(_that.name,_that.email);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SocialIdTokenUserName? name,  String? email)  $default,) {final _that = this;
switch (_that) {
case _SocialIdTokenUser():
return $default(_that.name,_that.email);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SocialIdTokenUserName? name,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _SocialIdTokenUser() when $default != null:
return $default(_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialIdTokenUser implements SocialIdTokenUser {
  const _SocialIdTokenUser({this.name, this.email});
  factory _SocialIdTokenUser.fromJson(Map<String, dynamic> json) => _$SocialIdTokenUserFromJson(json);

@override final  SocialIdTokenUserName? name;
@override final  String? email;

/// Create a copy of SocialIdTokenUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialIdTokenUserCopyWith<_SocialIdTokenUser> get copyWith => __$SocialIdTokenUserCopyWithImpl<_SocialIdTokenUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialIdTokenUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialIdTokenUser&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'SocialIdTokenUser(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$SocialIdTokenUserCopyWith<$Res> implements $SocialIdTokenUserCopyWith<$Res> {
  factory _$SocialIdTokenUserCopyWith(_SocialIdTokenUser value, $Res Function(_SocialIdTokenUser) _then) = __$SocialIdTokenUserCopyWithImpl;
@override @useResult
$Res call({
 SocialIdTokenUserName? name, String? email
});


@override $SocialIdTokenUserNameCopyWith<$Res>? get name;

}
/// @nodoc
class __$SocialIdTokenUserCopyWithImpl<$Res>
    implements _$SocialIdTokenUserCopyWith<$Res> {
  __$SocialIdTokenUserCopyWithImpl(this._self, this._then);

  final _SocialIdTokenUser _self;
  final $Res Function(_SocialIdTokenUser) _then;

/// Create a copy of SocialIdTokenUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,}) {
  return _then(_SocialIdTokenUser(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as SocialIdTokenUserName?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SocialIdTokenUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SocialIdTokenUserNameCopyWith<$Res>? get name {
    if (_self.name == null) {
    return null;
  }

  return $SocialIdTokenUserNameCopyWith<$Res>(_self.name!, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// @nodoc
mixin _$SocialIdTokenUserName {

 String? get firstName; String? get lastName;
/// Create a copy of SocialIdTokenUserName
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialIdTokenUserNameCopyWith<SocialIdTokenUserName> get copyWith => _$SocialIdTokenUserNameCopyWithImpl<SocialIdTokenUserName>(this as SocialIdTokenUserName, _$identity);

  /// Serializes this SocialIdTokenUserName to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialIdTokenUserName&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName);

@override
String toString() {
  return 'SocialIdTokenUserName(firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $SocialIdTokenUserNameCopyWith<$Res>  {
  factory $SocialIdTokenUserNameCopyWith(SocialIdTokenUserName value, $Res Function(SocialIdTokenUserName) _then) = _$SocialIdTokenUserNameCopyWithImpl;
@useResult
$Res call({
 String? firstName, String? lastName
});




}
/// @nodoc
class _$SocialIdTokenUserNameCopyWithImpl<$Res>
    implements $SocialIdTokenUserNameCopyWith<$Res> {
  _$SocialIdTokenUserNameCopyWithImpl(this._self, this._then);

  final SocialIdTokenUserName _self;
  final $Res Function(SocialIdTokenUserName) _then;

/// Create a copy of SocialIdTokenUserName
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SocialIdTokenUserName].
extension SocialIdTokenUserNamePatterns on SocialIdTokenUserName {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialIdTokenUserName value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialIdTokenUserName() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialIdTokenUserName value)  $default,){
final _that = this;
switch (_that) {
case _SocialIdTokenUserName():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialIdTokenUserName value)?  $default,){
final _that = this;
switch (_that) {
case _SocialIdTokenUserName() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? firstName,  String? lastName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialIdTokenUserName() when $default != null:
return $default(_that.firstName,_that.lastName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? firstName,  String? lastName)  $default,) {final _that = this;
switch (_that) {
case _SocialIdTokenUserName():
return $default(_that.firstName,_that.lastName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? firstName,  String? lastName)?  $default,) {final _that = this;
switch (_that) {
case _SocialIdTokenUserName() when $default != null:
return $default(_that.firstName,_that.lastName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialIdTokenUserName implements SocialIdTokenUserName {
  const _SocialIdTokenUserName({this.firstName, this.lastName});
  factory _SocialIdTokenUserName.fromJson(Map<String, dynamic> json) => _$SocialIdTokenUserNameFromJson(json);

@override final  String? firstName;
@override final  String? lastName;

/// Create a copy of SocialIdTokenUserName
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialIdTokenUserNameCopyWith<_SocialIdTokenUserName> get copyWith => __$SocialIdTokenUserNameCopyWithImpl<_SocialIdTokenUserName>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialIdTokenUserNameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialIdTokenUserName&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName);

@override
String toString() {
  return 'SocialIdTokenUserName(firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class _$SocialIdTokenUserNameCopyWith<$Res> implements $SocialIdTokenUserNameCopyWith<$Res> {
  factory _$SocialIdTokenUserNameCopyWith(_SocialIdTokenUserName value, $Res Function(_SocialIdTokenUserName) _then) = __$SocialIdTokenUserNameCopyWithImpl;
@override @useResult
$Res call({
 String? firstName, String? lastName
});




}
/// @nodoc
class __$SocialIdTokenUserNameCopyWithImpl<$Res>
    implements _$SocialIdTokenUserNameCopyWith<$Res> {
  __$SocialIdTokenUserNameCopyWithImpl(this._self, this._then);

  final _SocialIdTokenUserName _self;
  final $Res Function(_SocialIdTokenUserName) _then;

/// Create a copy of SocialIdTokenUserName
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,}) {
  return _then(_SocialIdTokenUserName(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
