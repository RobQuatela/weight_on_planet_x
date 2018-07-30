import 'package:flutter/material.dart';
import './ui/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Weight on Planet X',
      home: new Home(),
    );
  }
}