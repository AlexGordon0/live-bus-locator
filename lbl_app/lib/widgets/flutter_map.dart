import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Widget flutterMap() {
  return FlutterMap(
    options: mapOptions(),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      ),
    ],
  );
}

MapOptions mapOptions() {
  return const MapOptions(
    initialCenter: LatLng(51.4585, -2.6022),
    minZoom: 1,
    maxZoom: 19,
    interactionOptions: InteractionOptions(
      flags: ~InteractiveFlag.rotate & ~InteractiveFlag.doubleTapZoom
    ),
  );
}