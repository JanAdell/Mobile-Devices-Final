import 'package:flutter/material.dart';
import 'package:disp_mob/Screens/home.dart';

void main() => runApp(ChoHanApp());

class ChoHanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomeScreen(),
    );
  }
}