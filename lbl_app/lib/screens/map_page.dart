import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:lbl_app/api/bus_service.dart';
import 'package:lbl_app/widgets/flutter_map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<LatLng> busLocations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Map"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() async {
                    busLocations = await BusService().fetchLocations();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: flutterMap(busLocations));
  }
}
