import 'package:flutter/material.dart';
import 'package:disp_mob/Screens/game.dart';
import 'package:disp_mob/background.dart';
import 'package:disp_mob/Screens/credits.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  
  final topsection = new Container();
  final bottomsection = new Container();
  
  @override

  Widget build(BuildContext context){
    return Scaffold(
      
      /*appBar: AppBar(
        title: Text('Easy Cho Han', style: TextStyle(fontSize: 40),),
        centerTitle: true,
    ),*/
    body: Container(
        
    child: new Column(
      
      
      //crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
     
      
      new Container(
        
          child: Text("Easy Cho Han", style: 
          new TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600,
              fontSize: 60.0,
              
          ),
          
          ),
          alignment: Alignment.center,
          //margin: EdgeInsets.all(0),
      ),  
    
      //new Image.asset("assets/chohanhome.jpg"),

      new FlatButton(
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
     
      
      new FlatButton(
                    child: Text('Credits', style: TextStyle(fontSize: 40),),
                    color: Colors.blueGrey,       
                    splashColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        
                    onPressed: ()
                    {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreditsScreen()),
                    );
                    },
                    ),    
     
      new FlatButton(
                    child: Text('Quit', style: TextStyle(fontSize: 40),),
                    color: Colors.blueGrey,       
                    splashColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        
                    onPressed: ()=>exit(0),
                    /*{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreditsScreen()),
                    );
                    },*/
                    ),             

      ],
    ),
    
  ),
  );
  }
}
