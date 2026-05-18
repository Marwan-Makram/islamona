import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:islamona/model/PrayerTimes.dart';

class PrayerTimesController {
  static double? pLat;
  static double? pLong;
  final Connectivity _connectivity = Connectivity();

  Future<AzkarApp> fetchPrayerTimesByLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    pLat = position.latitude;
    pLong = position.longitude;

    String date = DateTime.now().toIso8601String();

    final response = await http.get(
      Uri.parse(
          "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong"),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return AzkarApp.fromJson(data);
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}
