import 'package:flutter/material.dart';
import 'package:disp_mob/Screens/game.dart';
import 'package:disp_mob/Screens/credits.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
    
  @override

  Widget build(BuildContext context){
    return Scaffold(
      
      
    body: DecoratedBox(
      
      position: DecorationPosition.background,
              decoration: BoxDecoration(
                color: Colors.white, 
                image: DecorationImage(
                    image: AssetImage('assets/bgi.jpg'),
                    fit: BoxFit.cover),
              ),
      
      
      child: Column(
             
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
     
      
      Container(
        
          child: Text("Easy Chō-han", style: 
          TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 30.0,
              
          ),
          
          ),
          alignment: Alignment.center,
          
      ),  
    
      
      FlatButton(
                    child: Text('Play', style: TextStyle(fontSize: 30),),
                    color: Colors.blueGrey,       
                    splashColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    
                    onPressed: ()
                    {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()),
                    );
                    },
                    ),
     
      
      FlatButton(
                    child: Text('Credits', style: TextStyle(fontSize: 30),),
                    color: Colors.blueGrey,       
                    splashColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        
                    onPressed: ()
                    {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreditsScreen()),
                    );
                    },
                    ),    
     
      FlatButton(
                    child: Text('Quit', style: TextStyle(fontSize: 30),),
                    color: Colors.blueGrey,       
                    splashColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        
                    onPressed: ()=>exit(0),
                    
                    ),             

      ],
    ),
    
  ),
  );
  }
}
