// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationDataImpl _$$LocationDataImplFromJson(Map<String, dynamic> json) =>
    _$LocationDataImpl(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationDataImplToJson(_$LocationDataImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'speed': instance.speed,
    };
