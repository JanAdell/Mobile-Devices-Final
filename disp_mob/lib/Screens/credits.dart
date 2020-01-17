import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsScreen extends StatefulWidget {
  @override

  _CreditsScreenState createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Credits', style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.blueGrey,
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

    child: Column(
       
      children: <Widget>[
          
      Container(
          
          child: Text("Created By Guillem Sánchez and Jan Adell", style: 
          TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              
          ),
          
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
      ), 
      
      Container(
        
          child: Text('This App was created as final project for the '
                      ' Mobile Devices subject in the Videogame Design '
                      ' and Development Degree at CITM (UPC). In it we '
                      ' implement a classic Japanese gambling game called '
                      ' Cho Han in the form of a mobile Android App. ', 
          style: 
          TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              
          ),
          
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
      ),  
      Container(
        
          child: Text('Press the button below to go to our GitHub Repository '
                      ' where you can find the making process and code. ',
          style: 
          TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              
          ),
          
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
      ),

      Container(
      child: RaisedButton(
        onPressed: _launchURL,
        child: Text('To GitHub Repository', style: TextStyle(fontSize: 20),),
        color: Colors.blueGrey,
        splashColor: Colors.black,
        
        ),
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        ),
       
  
      ]
    ),
    ),
    );
  }
}

_launchURL() async {
  const url = 'https://github.com/JanAdell/Mobile-Devices-Final';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}