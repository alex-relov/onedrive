import 'package:dio/dio.dart';
import 'package:onedrive/onedrive.dart';
import 'package:onedrive/src/models/dtos/drive.dart';
import 'package:onedrive/src/models/dtos/item.dart';
import 'package:onedrive/src/models/dtos/result.dart';

class OneDriveClient {
  final OneDriveConfig config;
  late final Dio _client = Dio(BaseOptions(
      baseUrl: "https://graph.microsoft.com/v1.0/",
      headers: {"Authorization": "Bearer ${config.accessToken}"}));

  OneDriveClient({required this.config});

  Future<List<Drive>> getDrives({CancelToken? cancelToken}) async {
    var response = await _client.get("/me/drives", cancelToken: cancelToken);
    return Result<Drive>.fromJson(response.data, Drive.fromJson).value;
  }

  Future<Drive> getDrive({CancelToken? cancelToken}) async {
    var response = await _client.get("/me/drive", cancelToken: cancelToken);
    return Drive.fromJson(response.data);
  }

  Future<List<Item>> getRootItems({CancelToken? cancelToken}) async {
    var response =
        await _client.get("/me/drive/root/children", cancelToken: cancelToken);
    return Result<Item>.fromJson(response.data, Item.fromJson).value;
  }

  Future<List<Item>> getItems(String itemId, {CancelToken? cancelToken}) async {
    var response = await _client.get("/me/drive/items/$itemId/children",
        cancelToken: cancelToken);
    return Result<Item>.fromJson(response.data, Item.fromJson).value;
  }

  Future download(String itemId, String savePath,
      {ProgressCallback? onReceiveProgress, CancelToken? cancelToken}) {
    return _client.download("/me/drive/items/$itemId/content", savePath,
        onReceiveProgress: onReceiveProgress, cancelToken: cancelToken);
  }
}
