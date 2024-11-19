import 'package:dio/dio.dart';
import 'package:onedrive/onedrive.dart';

class RefreshTokenInterceptor extends QueuedInterceptor {
  final RefreshTokenClient _refreshTokenClient = RefreshTokenClient();
  final ITokenHandler tokenHandler;
  final String clientId;

  RefreshTokenInterceptor({required this.tokenHandler, required this.clientId});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        "Bearer ${tokenHandler.getAccessToken()}";
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      var tokenPair = await _refreshTokenClient.refreshToken(
          tokenHandler.getRefreshToken(), clientId);
      await tokenHandler.saveTokens(tokenPair);
      err.requestOptions.headers['Authorization'] =
          'Bearer ${tokenPair.accessToken}';
      return handler.resolve(await Dio().fetch(err.requestOptions));
    }
    return handler.next(err);
  }
}
