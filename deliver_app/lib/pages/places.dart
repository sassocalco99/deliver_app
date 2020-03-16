import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../style/style.dart';
import '../pages/card.dart';
import '../pages/current_position.dart';
import 'package:http/http.dart' as http;

final String jsonLink = "https://next.json-generator.com/api/json/get/VkchDkUru?indent=4";

class Place {
  final String id;
  final int index;
  final int rating;
  final String picture;
  final String company;
  final String phone;
  final String about;
  var latitude;
  var longitude;
  String address;
  var distance;
  final String tag;

  Place({this.id, this.index, this.rating, this.picture, this.company, this.phone, this.about, this.latitude, this.longitude, this.tag});

  factory Place.fromJson(Map<String, dynamic> json){
    return Place(
      id: json['_id'] as String,
      index: json['index'] as int,
      rating: json['rating'] as int,
      picture: json['picture'] as String,
      company: json['company'] as String,
      phone: json['phone'] as String,
      about: json['about'] as String,
      latitude: json['latitude'],
      longitude: json['longitude'],
      tag: json['kinds'] as String,
    );
  }

  Future<double> getDistance() async{
   double distance = await Geolocator().
      distanceBetween(double.parse(latitude), double.parse(longitude), getPosition().latitude, getPosition().longitude);
    return distance;
  }

}

List<Place> parsePlaces(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Place>((json) => Place.fromJson(json)).toList();
}

Future<List<Place>> fetchPlaces(http.Client client) async {
  final response = await client.get(jsonLink);
  return compute(parsePlaces, response.body);
}

class PlacesList extends StatelessWidget {
  final List<Place> places;
  final String tag;
  String littleTag;

  List<Place>filterList(){
    var tmp = new List<Place>();

    if(tag != null){
      littleTag = tag.toLowerCase();
      for(Place place in places){
        if(place.tag == tag.toLowerCase()) tmp.add(place);
      }
      return tmp;
    }
    return null;
  }

  PlacesList({Key key, this.places, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var placeToView = (filterList() == null) ? places : filterList();

    return ListView.builder(
        itemCount: placeToView.length,
        itemBuilder: (context, index){
      return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.green[700]
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset('images/$littleTag.png', fit: BoxFit.fitWidth),
                  ),
                ],
              )
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 280,
                        child: Text("  "+placeToView[index].company, style: pageBoxStyle),
                      ),

                      Expanded(
                        child: Text(placeToView[index].rating.toString()+"/5",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,

                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.deepPurple,
                        size: 50,
                      ),

                    ],
                  ),
                )
            ),
            InkResponse(
              onTap: () {
                print(placeToView[index].longitude);
                /*
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlaceCard(place: placeToView[index])
                    )
                );

                 */
                showDialog(context: context, child: PlaceCard(place: placeToView[index]));
              }
            )

          ],
        ),
      );
    });
  }
}


