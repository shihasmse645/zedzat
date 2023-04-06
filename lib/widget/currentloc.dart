import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLocationWidget extends StatefulWidget {
  @override
  _MyLocationWidgetState createState() => _MyLocationWidgetState();
}

class _MyLocationWidgetState extends State<MyLocationWidget> {
  String _location = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _location = 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _location,
      style: TextStyle(fontSize: 16),
    );
  }
}
