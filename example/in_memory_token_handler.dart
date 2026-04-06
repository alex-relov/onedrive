import 'package:onedrive/src/handlers/token_handler.dart';
import 'package:onedrive/src/models/jwt_token.dart';

class InMemoryTokenHandler implements ITokenHandler {
  String accesToken = "";
  String refreshToken = "";

  @override
  String getAccessToken() => accesToken;

  @override
  Future<String> getRefreshToken() => Future.value(refreshToken);

  @override
  Future saveTokens(JwtToken tokens) async {
    accesToken = tokens.accessToken;
    refreshToken = tokens.refreshToken;
  }
}
