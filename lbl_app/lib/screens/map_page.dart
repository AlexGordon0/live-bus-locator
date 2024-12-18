import 'package:flutter/material.dart';
import 'package:lbl_app/widgets/flutter_map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: flutterMap()
    );
  }
}
