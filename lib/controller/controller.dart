import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_app/main.dart';

Future<bool> isLocationEnabled() async {
  return await Geolocator.isLocationServiceEnabled();
}

Future<bool> requestLocationPermission() async {
  var permission = await Geolocator.checkPermission();
  String messageToShow;
  bool isPermissionGranted = true;

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      messageToShow = 'Location permission denied';
      isPermissionGranted = false;
    } else {
      messageToShow = 'Location permission granted';
    }
  } else {
    messageToShow = 'Location permission already granted';
  }

  if (permission == LocationPermission.deniedForever) {
    messageToShow = 'Location denied forever';
    isPermissionGranted = false;
  }

  MyApp.scaffoldMessangerKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(messageToShow),
    ),
  );

  return isPermissionGranted;
}
