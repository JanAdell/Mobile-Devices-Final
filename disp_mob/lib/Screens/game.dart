import 'package:flutter/material.dart';


class GameScreen extends StatefulWidget {
  @override

  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(//provisional mentre posem el joc amb firebase per saber a quina finestra som
        title: Text('Game'),
        centerTitle: true,
    ),
    body: DecoratedBox(
      
      position: DecorationPosition.background,
              decoration: BoxDecoration(
                color: Colors.white, 
                image: DecorationImage(
                    image: AssetImage('assets/bgi.jpg'),
                    fit: BoxFit.cover),
              ),
    child: null,
    ),
    
    );
    
  }
}