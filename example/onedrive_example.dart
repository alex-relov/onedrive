import 'package:onedrive/onedrive.dart';

Future<void> main() async {
  final OneDriveClient oneDriveClient =
      OneDriveClient(config: OneDriveConfig(accessToken: ""));

  var drive = await oneDriveClient.getDrive();
  var rootItems = await oneDriveClient.getRootItems();
  var firstItem = await oneDriveClient.getItems(rootItems[0].id);
  var drives = await oneDriveClient.getDrives();
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');
}
