import 'package:json_annotation/json_annotation.dart';
import 'package:onedrive/src/models/dtos/base_item.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends BaseItem {
  String eTag = "";
  String cTag = "";
  int size = 0;
  Item();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
