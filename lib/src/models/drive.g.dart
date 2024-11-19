// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drive _$DriveFromJson(Map<String, dynamic> json) => Drive()
  ..createdDateTime = DateTime.parse(json['createdDateTime'] as String)
  ..id = json['id'] as String
  ..lastModifiedDateTime =
      DateTime.parse(json['lastModifiedDateTime'] as String)
  ..name = json['name'] as String
  ..webUrl = json['webUrl'] as String
  ..description = json['description'] as String
  ..driveType = json['driveType'] as String;

Map<String, dynamic> _$DriveToJson(Drive instance) => <String, dynamic>{
      'createdDateTime': instance.createdDateTime.toIso8601String(),
      'id': instance.id,
      'lastModifiedDateTime': instance.lastModifiedDateTime.toIso8601String(),
      'name': instance.name,
      'webUrl': instance.webUrl,
      'description': instance.description,
      'driveType': instance.driveType,
    };
