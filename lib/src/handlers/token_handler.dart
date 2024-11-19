import 'package:onedrive/src/models/jwt_token.dart';

abstract interface class ITokenHandler {
  String getAccessToken();
  String getRefreshToken();

  Future saveTokens(JwtToken tokens);
}
