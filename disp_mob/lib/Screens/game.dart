import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';


class GameScreen extends StatefulWidget {
  @override

  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(//provisional name used while the window is being worked on 
        title: Text('Chō-han', style: TextStyle(fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        
    ),
    body: ButtonTest(),
        
    );
    
  }
}


class ButtonTest extends StatefulWidget {
  @override
  _ButtonTestState createState() => _ButtonTestState();
}

class _ButtonTestState extends State<ButtonTest> {
  bool pair;
  int numtokens;

  @override
  void initState() {
    numtokens = 0;
    pair = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        StreamBuilder(
            stream: Firestore.instance.collection('game').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );

              List<DocumentSnapshot> docs = snapshot.data.documents;
              Map<String, dynamic> data =
                  docs[0].data; // Este es un * a el primer elemento de game.
              numtokens = data['Tokens'];
              return Container();
            }),
        SizedBox(
          height: 10,
        ),
        Text(
          ' Tokens: $numtokens',
          style: TextStyle(fontSize: 25),
        ),
      //  RaisedButton(child: Text('Recharge'),)
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Pair', style: TextStyle(fontSize: 35)),
                  onPressed: () {
                    setState(
                      () {
                        pair = true;
                      },
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bet365(
                          pair: pair,
                          totaltokens: numtokens,
                          reset: false,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 80,
                ),
                RaisedButton(
                  child: Text('Odd', style: TextStyle(fontSize: 35)),
                  onPressed: () {
                    setState(
                      () {
                        pair = false;
                      },
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bet365(
                          pair: pair,
                          totaltokens: numtokens,
                          reset: false,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        )),
      ],
    ));
  }
}

class Bet365 extends StatefulWidget {
  final bool pair;
  final int totaltokens;
  final bool reset;

  Bet365({Key key, @required this.pair, @required this.totaltokens, @required this.reset})
      : super(key: key);

  @override
  _Bet365State createState() => _Bet365State();
}

class _Bet365State extends State<Bet365> {
  final Random rng = new Random();
  int numtokens;
  int rngnum;

  @override
  void initState() {
    numtokens = 0;
    rngnum = 0;
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Num tokens'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            ' Tokens: ${widget.totaltokens}',
            style: TextStyle(fontSize: 25),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 220,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        '+1',
                        style: TextStyle(fontSize: 30),
                      ),
                      onPressed: () {
                        setState(() {
                          if (numtokens <= (widget.totaltokens - 1))
                            numtokens += 1;
                        });
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      margin: EdgeInsets.all(30),
                      child: Center(
                        child: Text(
                          '$numtokens',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    RaisedButton(
                      child: Text(
                        '-1',
                        style: TextStyle(fontSize: 30),
                      ),
                      onPressed: () {
                        setState(() {
                          if (numtokens >= 1) numtokens -= 1;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Lets Bet!', style: TextStyle(fontSize: 40)),
                  onPressed: () {
                    setState(() {
                      rngnum = rng.nextInt(12) + 1;
                    });
                    if ((rngnum % 2 == 0 && widget.pair == true) ||
                        (rngnum % 2 != 0 && widget.pair == false)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Victory(
                            rngnum: rngnum,
                            numtokens: numtokens,
                            pair: widget.pair,
                            totaltokens: widget.totaltokens,
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Defeat(
                            rngnum: rngnum,
                            numtokens: numtokens,
                            pair: widget.pair,
                            totaltokens: widget.totaltokens,
                          ),
                        ),
                      );
                    }
                  },
                ),
                // Helper para saber que numero ha salido.
                //Text('$rngnum'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Victory extends StatefulWidget {
  final int rngnum;
  final int numtokens;
  final bool pair;
  final int totaltokens;

  Victory(
      {Key key,
      @required this.rngnum,
      @required this.numtokens,
      @required this.pair,
      @required this.totaltokens})
      : super(key: key);
  @override
  _VictoryState createState() => _VictoryState();
}

class _VictoryState extends State<Victory> {

  int newtokens;

  @override
  void initState() {
    newtokens = widget.numtokens + widget.totaltokens;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Victory!!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder(
              stream: Firestore.instance.collection('game').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                Map<String,dynamic> tosend = {'Tokens': newtokens, 'Random': widget.rngnum,'Pair': widget.pair};
                Firestore.instance.collection('game').document('Tokensplayer').setData(tosend);
                return Container();
              }),
          SizedBox(
            height: 10,
          ),
          Text(
            ' Tokens: $newtokens',
            style: TextStyle(fontSize: 25),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text('You Win!!', style: TextStyle(fontSize: 50)),
              Text('The result was ${widget.rngnum}'),
              RaisedButton(
                child: Text('Play Again'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class Defeat extends StatefulWidget {
  final int rngnum;
  final int numtokens;
  final bool pair;
  final int totaltokens;

  Defeat(
      {Key key,
      @required this.rngnum,
      @required this.numtokens,
      @required this.pair,
      @required this.totaltokens})
      : super(key: key);
  @override
  _DefeatState createState() => _DefeatState();
}

class _DefeatState extends State<Defeat> {
   int newtokens;

  @override
  void initState() {
    newtokens = widget.totaltokens - widget.numtokens;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Defeat D:'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder(
              stream: Firestore.instance.collection('game').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                Map<String,dynamic> tosend = {'Tokens': newtokens, 'Random': widget.rngnum, 'Pair': widget.pair};
                Firestore.instance.collection('game').document('Tokensplayer').setData(tosend);

                
                return Container();
              }),
          SizedBox(
            height: 10,
          ),
          Text(
            ' Tokens: $newtokens',
            style: TextStyle(fontSize: 25),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text('You Lost!!', style: TextStyle(fontSize: 50)),
              Text('The result was ${widget.rngnum}'),
              RaisedButton(
                child: Text('Play Again'),
                onPressed: () {
                   Navigator.pop(context);
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
