import 'package:deliverapp/items/item.dart';
import 'package:deliverapp/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/places.dart';
import 'package:http/http.dart' as http;
import '../pages/current_position.dart';

class TagPage extends StatefulWidget {
  final String tag;



  TagPage({Key key, this.tag}) : super(key: key);

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<TagPage>{
  List<Place> places;
  bool sorted = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          backgroundColor: Colors.deepPurple[100],
          //todo textfield
          appBar: AppBar(
            title: Text("to add textfield"),
          ),
          body: Hero(
            tag: '${this.widget.tag}',
            child: FutureBuilder<List<Place>>(
              future: fetchPlaces(http.Client()),
              builder: (context, snapshot){
                if(snapshot.hasError) print(snapshot.error);

                if(snapshot.hasData){
                  places = snapshot.data;
                  return new PlacesList(places: snapshot.data, tag: this.widget.tag);
                }
                return Center(child: CircularProgressIndicator());
              }
          )),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.tune),
            onPressed: () {
                showDialog(context: context,
                child: Align(
                  alignment: Alignment(0, 0.95),
                  child: Material(
                    shape: CircleBorder(),
                    child: Container(
                      height: 60,
                      width: 200,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        splashColor: Colors.deepPurple,
                        onTap: () {
                          setState(() {
                            sorted = !sorted;
                            isSorted = sorted;
                          });
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: (sorted) ?
                              Text("Default sort", textScaleFactor: 1.5) :
                              Text("Sort by distance", textScaleFactor: 1.5)
                          )
                        )
                      )

                    ),
                  ),
                )

                );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


    );
  }

}
