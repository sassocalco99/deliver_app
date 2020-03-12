import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../style/style.dart';
import 'package:flutter/widgets.dart';
import '../items/item.dart';
import '../pages/current_position.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CurrentPosition(),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.yellow
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                //todo add textfield
                child: Text("Hello", style: searchStyle),
              ),
            ),
          ),
          Container(
            height: 60,
          ),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ItemBox(
                    name: "Shopping",
                  ),
                  new ItemBox(
                    name: "Food",
                  ),
                ],
              )
          ),
          Center(
            child: new ItemBox(
              name: "Your Profile",
            )
          ),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ItemBox(
                    name: "Bakery",
                  ),
                  new ItemBox(
                    name: "Pharmacy",
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
