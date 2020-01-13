import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:disp_mob/Screens/game.dart';
import 'package:disp_mob/Screens/credits.dart';

class HomeScreen extends StatefulWidget {
  @override

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy Cho Han', style: TextStyle(fontSize: 40),),
        centerTitle: true,
    ),
    body: Center(
      child: FlatButton(
        child: Text('Play', style: TextStyle(fontSize: 40),),
        color: Colors.blueGrey,       
        splashColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        
        onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()),
        );
        },
        
        ),
    /*body: BottomAppBar(    
    child: RaisedButton(
        onPressed: (){},
        child: Text('Credits'),
               
        ),
    ),*/
    ),
    );
  }
}
