import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:location/location.dart';
// import 'package:google_maps_flutter_ios/google_maps_flutter_ios.dart';
class ShowsimpleMap extends StatefulWidget {
  const ShowsimpleMap({super.key});

  @override
  State<ShowsimpleMap> createState() => _ShowsimpleMapState();
}

class _ShowsimpleMapState extends State<ShowsimpleMap> {
  late GoogleMapController mapController;
  Map<String, Marker> _markers = {};

  final LatLng _center = const LatLng(2.080665, 45.365411);
  
  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _onMapCreated(controller);
          addMarker("test", _center);
        },
        markers: _markers.values.toSet(),
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        
        ),
    );
  }
  
  addMarker(String id, LatLng location) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(), 
      "assets/images/kangroo.png",);
      var marker = Marker(markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: 'Title of place',
        snippet: "Some description of the place",
      ),
      icon: markerIcon,);
      _markers[id] = marker;
      setState(() {
        
      });
  }
  
}