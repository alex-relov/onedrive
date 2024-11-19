import 'package:json_annotation/json_annotation.dart';

part 'jwt_token.g.dart';

@JsonSerializable()
class JwtToken {
  @JsonKey(name: "access_token")
  String accessToken = "";

  @JsonKey(name: "refresh_token")
  String refreshToken = "";

  JwtToken();

  factory JwtToken.fromJson(Map<String, dynamic> json) =>
      _$JwtTokenFromJson(json);
  Map<String, dynamic> toJson() => _$JwtTokenToJson(this);
}
