import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../pages/places.dart';
import '../style/style.dart';

class PlaceCard extends StatelessWidget{
  final Place place;

  PlaceCard({Key key, @required this.place});

  @override
  Widget build(BuildContext context) {

    return Center(
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset('images/food.png', fit: BoxFit.fitWidth),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                ]),
                subtitle: Row(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Text("  "+place.company, style: pageBoxStyle),
                    ),

                    Expanded(
                      child: Text(place.rating.toString()+"/5",
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
              ),
              Divider(),
              ListTile(
                title: Text('About'),
                subtitle: Text(place.about),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(place.phone),
              ),
              ListTile(
                leading: Icon(Icons.business),
                title: Text(place.position.toString()),
              )
            ],
          ),
        )
    );
  }

}