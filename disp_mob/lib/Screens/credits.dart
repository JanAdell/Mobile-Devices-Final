import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:disp_mob/Screens/home.dart';

class CreditsScreen extends StatefulWidget {
  @override

  _CreditsScreenState createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Credits', style: TextStyle(fontSize: 20),),
        centerTitle: true,
    ),
    
    );
    
  }
}