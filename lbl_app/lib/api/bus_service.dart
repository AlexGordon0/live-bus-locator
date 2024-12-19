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
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response);
      print(response.body);
      var data = json.decode(response.body);
      List<LatLng> locations = [];
      for (var i in data) {
        locations.add(LatLng(i[0], i[1]));
      }
      return locations;
    } else {
      throw Exception('Failed to get location data');
    }
  }
}
