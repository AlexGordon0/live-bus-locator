import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'dart:convert';

class BusService {
  final apiURL = 'http://127.0.0.1:8000';

  Future<List<LatLng>> fetchLocations() async {
    final response =
        await http.get(Uri.parse("$apiURL/get/location"), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get location data');
    }
  }
}
