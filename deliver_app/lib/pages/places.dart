import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "package:google_maps_webservice/places.dart";"
import 'package:http/http.dart';

final places = new GoogleMapsPlaces(apiKey: "AIzaSyBa9tsiUyoaLNptEi4jXfb1ves-eusXAZE");
final String apiKey = "AIzaSyBa9tsiUyoaLNptEi4jXfb1ves-eusXAZE";

//todo implement

PlacesSearchResponse reponse = await places.searchNearbyWithRadius(new Location(31.0424, 42.421), 500);

String search = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=mongolian%20grill&inputtype=textquery&fields=photos,formatted_address,name,opening_hours,rating&locationbias=circle:2000@47.6918452,-122.2226413&key="+apiKey ;