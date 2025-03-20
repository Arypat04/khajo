import 'package:flutter/material.dart';
import 'package:khajo/Screens/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliding Pill Button',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage()
    );
  }
}
