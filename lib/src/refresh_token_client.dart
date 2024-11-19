import 'package:dio/dio.dart';
import 'package:onedrive/onedrive.dart';

class RefreshTokenClient {
  final Dio _client = Dio(BaseOptions(baseUrl: "https://login.live.com/"));

  Future<JwtToken> refreshToken(String refreshToken, String clientId) async {
    // var request = RefreshTokenRequest(
    //     clientId: clientId,
    //     refreshToken: refreshToken,
    //     grantType: "refresh_token");

    final Map<String, String> formData = {
      'client_id': clientId,
      'refresh_token': refreshToken,
      'grant_type': 'refresh_token'
    };
    var result = await _client.post("oauth20_token.srf",
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: formData);
    return JwtToken.fromJson(result.data);
  }
}
