import 'package:flutter/material.dart';
import 'package:responsiveui/expandedexample.dart';
import 'package:responsiveui/responsive.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: MasterDetailPage()),
    );
  }
}
