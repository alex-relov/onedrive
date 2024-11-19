import 'package:onedrive/onedrive.dart';

import 'in_memory_token_handler.dart';

Future<void> main() async {
  final ITokenHandler tokenHandler = InMemoryTokenHandler();
  late final OneDriveClient oneDriveClient = OneDriveClient(
      clientId: "70a53ae8-f8bb-41cd-ab76-716eeb960065",
      tokenHandler: tokenHandler);

  var initJwt = JwtToken()
    ..accessToken = ""
    ..refreshToken = "";

  await tokenHandler.saveTokens(initJwt);

  var drive = await oneDriveClient.getDrive();
  var rootItems = await oneDriveClient.getRootItems();
  var firstItem = await oneDriveClient.getItems(rootItems[0].id);
  var drives = await oneDriveClient.getDrives();

  await oneDriveClient.download(
    "id",
    "file.zip",
    onReceiveProgress: (count, total) {
      print("count: $count, total: $total");
    },
  );
}
