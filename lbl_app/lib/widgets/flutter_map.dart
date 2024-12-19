import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:lbl_app/widgets/bus_marker.dart';

Widget flutterMap(busLocations) {
  return FlutterMap(
    options: mapOptions(),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      ),
      busMarkers(busLocations),
    ],
  );
}

MapOptions mapOptions() {
  return const MapOptions(
    initialCenter: LatLng(51.4585, -2.6022),
    minZoom: 1,
    maxZoom: 19,
    interactionOptions: InteractionOptions(
        flags: ~InteractiveFlag.rotate & ~InteractiveFlag.doubleTapZoom),
  );
}

MarkerLayer busMarkers(List<LatLng> busLocations) {
  List<Marker> markers = [];
  for (int i = 0; i < busLocations.length; i++) {
    markers.add(Marker(point: busLocations[i], child: const BusMarker()));
  }
  return MarkerLayer(markers: markers);
}
