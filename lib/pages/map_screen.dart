import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Position? currentPosition;

  bool isCurrentLocationButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentPosition = position;
      isCurrentLocationButtonEnabled = true;
    });
  }

  void _goToCurrentLocation() {
    if (currentPosition != null && mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(
            currentPosition!.latitude,
            currentPosition!.longitude,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var googleMap = _googleMap();
    return Scaffold(
      body: googleMap,
      floatingActionButton: isCurrentLocationButtonEnabled
          ? FloatingActionButton(
              onPressed: _goToCurrentLocation,
              child: Icon(Icons.my_location),
            )
          : null,
    );
  }

  GoogleMap _googleMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(23.923307693172198, 90.71915123699199),
        zoom: 14,
      ),
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },

      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false, // Disable zoom controls
      markers: currentPosition != null
          ? [
              Marker(
                markerId: MarkerId('currentLocation'),
                position: LatLng(
                  currentPosition!.latitude,
                  currentPosition!.longitude,
                ),
              ),
            ].toSet()
          : Set<Marker>(),
    );
  }
}
