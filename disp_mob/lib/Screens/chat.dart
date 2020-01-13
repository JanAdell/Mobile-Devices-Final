import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override

  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat', style: TextStyle(fontSize: 50),),//provisional mentre posem el joc amb firebase per saber a quine finestra som
        centerTitle: true,
    ),
    
    );
    
  }
}