
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final LatLng aizawlCoordinate = const LatLng(23.727106, 92.717636);
  final double coordinateRange = 0.1; // Adjust the range as needed

  List<LatLng> generateRandomCoordinates(int count) {
    final random = Random();
    final List<LatLng> coordinates = [];

    for (int i = 0; i < count; i++) {
      double lat = aizawlCoordinate.latitude + random.nextDouble() * coordinateRange - coordinateRange / 2;
      double lng = aizawlCoordinate.longitude + random.nextDouble() * coordinateRange - coordinateRange / 2;
      coordinates.add(LatLng(lat, lng));
    }

    return coordinates;
  }

  @override
  Widget build(BuildContext context) {
    List<LatLng> dustbinCoordinates = generateRandomCoordinates(60); // Generate 10 random coordinates

    return Scaffold(
      appBar: AppBar(title: const Text('Nearby Dustbins'),),
      body: FlutterMap(
        options: MapOptions(
          center: aizawlCoordinate,
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: dustbinCoordinates
                .map((LatLng point) => Marker(
                      point: point,
                      builder: (ctx) => const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}








