import 'dart:async';

import 'package:dating/data/likes_json.dart';
import 'package:dating/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as p;

class LikesPage extends StatefulWidget {
  const LikesPage({Key key}) : super(key: key);

  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  Completer<GoogleMapController> _controller = Completer();
  p.Location location = new p.Location();

  static p.LocationData _locationData;

  bool _serviceEnabled;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.0226313, 105.8422716),
    zoom: 14.4746,
  );

  Set<Marker> _marker = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
        child: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      markers: _marker,
      onMapCreated: (GoogleMapController controller) {
        _onMapCreated(controller);
      },
      myLocationEnabled: true,
    ));
  }

  getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      _kGooglePlex = CameraPosition(
        target: LatLng(_locationData.latitude, _locationData.longitude),
        zoom: 14.4746,
      );
    });
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(_locationData.latitude, _locationData.longitude),
      zoom: 14.4746,
    )));
  }

  findAround() {
    setState(() {
      _marker.add(Marker(
          position: LatLng(_locationData.latitude, _locationData.longitude),
          infoWindow: InfoWindow(title: 'Hello', snippet: 'Good Job'),
          markerId: MarkerId('id-1')));
    });
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
        TextButton(
        child:Container(
              width: size.width - 70,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [yellow_one, yellow_two])),
              child: Center(
                child: Text("SEE WHO LIKES YOU",
                    style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          onPressed: () => findAround(),)
          ],
        ),
      ),
    );
  }
}
