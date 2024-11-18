// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item()
  ..createdDateTime = DateTime.parse(json['createdDateTime'] as String)
  ..id = json['id'] as String
  ..lastModifiedDateTime =
      DateTime.parse(json['lastModifiedDateTime'] as String)
  ..name = json['name'] as String
  ..webUrl = json['webUrl'] as String
  ..eTag = json['eTag'] as String
  ..cTag = json['cTag'] as String
  ..size = (json['size'] as num).toInt();

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'createdDateTime': instance.createdDateTime.toIso8601String(),
      'id': instance.id,
      'lastModifiedDateTime': instance.lastModifiedDateTime.toIso8601String(),
      'name': instance.name,
      'webUrl': instance.webUrl,
      'eTag': instance.eTag,
      'cTag': instance.cTag,
      'size': instance.size,
    };
