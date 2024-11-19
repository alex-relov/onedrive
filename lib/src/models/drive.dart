import 'package:json_annotation/json_annotation.dart';
import 'package:onedrive/src/models/base_item.dart';

part 'drive.g.dart';

@JsonSerializable()
class Drive extends BaseItem {
  String description = "";
  String driveType = "";
  Drive();

  factory Drive.fromJson(Map<String, dynamic> json) => _$DriveFromJson(json);
  Map<String, dynamic> toJson() => _$DriveToJson(this);
}
