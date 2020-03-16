import 'package:deliverapp/items/item.dart';
import 'package:deliverapp/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/places.dart';
import 'package:http/http.dart' as http;

class TagPage extends StatefulWidget {
  final String tag;



  TagPage({Key key, this.tag}) : super(key: key);

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<TagPage>{
  List<Place> places;
  bool value = false;

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

                return (snapshot.hasData) ?
                new PlacesList(places: snapshot.data, tag: this.widget.tag) :
                Center(child: CircularProgressIndicator());
              }
          )),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.tune),
            onPressed: () {
                showDialog(context: context,
                child: Align(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(8))
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: FlatButton(
                                        child: Text("Order by distance"),
                                      ),
                                    )
                                ),
                                VerticalDivider(),
                                SizedBox(
                                  width: 100,
                                  child: Switch.adaptive(
                                    value: value,
                                    onChanged: (bool val) {
                                      setState(() {
                                        value = val;
                                      });
                                    },
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    )
                )

                );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


    );
  }

}
