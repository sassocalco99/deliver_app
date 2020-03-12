import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivering',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Delivering Home Page'),
    );
  }
}

//todo Connect with Maps