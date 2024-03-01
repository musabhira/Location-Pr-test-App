// import 'package:location/location.dart';
import 'dart:async';
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/model/state_model.dart';

part 'home_state_provider.g.dart';

@riverpod
class HomeState extends _$HomeState {
  @override
  ProviderState build() {
    _getLocationData();

    return ProviderState(
      locations: [],
      timer: null,
    );
  }

  Future<Position> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }

  /// Start polling
  Future<void> startLocationPolling() async {
    /// If any timer already exists, tehn do nothing
    if (state.timer != null) {
      return;
    }

    final timer = Timer.periodic(const Duration(seconds: 30), (timer) async {
      final newLocation = await _getCurrentLocation();
      final locationData = LocationData(
        lat: newLocation.latitude,
        lon: newLocation.longitude,
        speed: newLocation.speed,
      );

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setDouble('latitude', newLocation.latitude);
      // prefs.setDouble('longitude', newLocation.longitude);
      state = state.copyWith(
        locations: [
          ...state.locations,
          locationData,
        ],
      );

      _saveLocation(locationData, state.locations.length - 1);

      // ignore: avoid_print
      // print(state.locations);
    });

    state = state.copyWith(timer: timer);
  }

  void stopLocationPolling() {
    if (state.timer != null) {
      state.timer!.cancel();
      state = state.copyWith(timer: null);
    }
  }

  void _saveLocation(LocationData data, int index) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString('$index', jsonEncode(data.toJson()));
  }

  Future<void> _getLocationData() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final locations = <LocationData>[];

    var i = 0;
    while (true) {
      if (sharedPrefs.containsKey(i.toString())) {
        final locationJson = sharedPrefs.getString('$i');
        locations.add(LocationData.fromJson(jsonDecode(locationJson!)));
      } else {
        break;
      }
    }

    state = state.copyWith(locations: locations);
  }
}
