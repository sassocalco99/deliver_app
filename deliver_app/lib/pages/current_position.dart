import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:flutter/services.dart';


class CurrentPosition extends StatefulWidget{

  @override
  _PositionState createState() => _PositionState();
}

class _PositionState extends State<CurrentPosition>{
  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();

    }).catchError((e) {
      print(e);
    });

  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  Widget _locationTitle() {
    try{
      if (_currentPosition != null) {
        return Text(_currentAddress);
      }else{
        return FlatButton(
            child: Text("Get Location",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold

              ),
            ),
            onPressed: () {
              _getCurrentLocation();
            });
      }
    }catch(e){

    }

  }

  @override
  Widget build(BuildContext context) {
      return Container(
        child: _locationTitle(),
      );
  }
}