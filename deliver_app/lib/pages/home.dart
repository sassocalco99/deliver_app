import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:deliverapp/style/style.dart';
import 'package:flutter/widgets.dart';

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
        title: Text(this.widget.title),
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
                child: Text("Hello", style: itemStyle),
              ),
            ),
          ),
          Container(
            height: 100,
          ),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      MaterialButton(
                        child: Text("Shopping"),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  ),
                ],
              )
          ),
          Center(
            child: Container(

              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Text("Select what\nyou want",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  )
                ),
              ),

            )
          ),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      MaterialButton(
                        child: Text("Bakery"),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      MaterialButton(
                        child: Text("Bakery"),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
