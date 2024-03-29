import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_model.freezed.dart';
part 'state_model.g.dart';

@freezed
class LocationData with _$LocationData {
  factory LocationData({
    required double lat,
    required double lon,
    required double speed,
  }) = _LocationData;

  factory LocationData.fromJson(Map<String, Object?> json) =>
      _$LocationDataFromJson(json);
}

@freezed
class ProviderState with _$ProviderState {
  factory ProviderState({
    required List<LocationData> locations,
    required Timer? timer,
  }) = _ProviderState;
}
