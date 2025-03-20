import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({super.key, required this.lat, required this.lon});

  final double lat; // Latitude for the map center
  final double lon; // Longitude for the map center

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // Rounded corners
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(lat, lon), // Center at given latitude/longitude
            zoom: 14.0,
            maxZoom: 18.0,
            minZoom: 3.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'com.example.app',
            ),
          ],
        ),
      ),
    );
  }
}