import 'package:flutter/material.dart';


class GameScreen extends StatefulWidget {
  @override

  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(//provisional name used while the window is being worked on 
        title: Text('Chō-han', style: TextStyle(fontSize: 50),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        
    ),
        
    );
    
  }
}