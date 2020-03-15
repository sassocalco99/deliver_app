import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/places.dart';
import 'package:http/http.dart' as http;

class TagPage extends StatelessWidget {
  final String tag;
  List<Place> places;


  TagPage({Key key, this.tag}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Hero(
        tag: '$tag',
        child: Scaffold(
          backgroundColor: Colors.deepPurple[100],
          //todo textfield
          appBar: AppBar(
            title: Text("to add textfield"),
          ),
          body: FutureBuilder<List<Place>>(
              future: fetchPlaces(http.Client()),
              builder: (context, snapshot){
                if(snapshot.hasError) print(snapshot.error);

                return (snapshot.hasData) ?
                new PlacesList(places: snapshot.data, tag: tag) :
                Center(child: CircularProgressIndicator());
              }
          ),
        )
    );
  }

}
