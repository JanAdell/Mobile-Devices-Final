import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:disp_mob/Screens/game.dart';

class ChatScreen extends StatefulWidget {
  @override

  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat', style: TextStyle(fontSize: 20),),
        centerTitle: true,
    ),
    
    );
    
  }
}