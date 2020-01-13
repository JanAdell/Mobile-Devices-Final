import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:disp_mob/Screens/home.dart';
import 'package:disp_mob/Screens/chat.dart';

class GameScreen extends StatefulWidget {
  @override

  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
        centerTitle: true,
    ),
    body: FloatingActionButton(
        child: Text('Chat', style: TextStyle(fontSize: 15),),
        //color: Colors.blueGrey,       
        splashColor: Colors.black,
        //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        
        onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        },
    ),
    );
    
  }
}