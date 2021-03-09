import 'dart:async';

import 'package:flutter/material.dart';
import 'game.dart';
import 'shop.dart';
//https://stackoverflow.com/questions/56715403/how-to-add-onclick-on-image-asset-in-flutter pressable images
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Game game = new Game(0.0,1.0,1.0);
  void startGame(){
    var duration = Duration(seconds: 1);
    if (game.timer == null || !game.timer.isActive) {
      game.timer = Timer.periodic(duration, (Timer timer) {
        setState(() {
            game.incrementCoin();
        });
      });
    }

  }
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => startGame());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 70.0),
          child: GestureDetector(
            onTap: () { /* Write listener code here */ },
            child: Icon(
              Icons.menu,  // add custom icons also
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 90.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Shop()));
                },
                child: Image.asset(
                  'assets/Coin.png',
                  width: 32.0,
                  height: 32.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 60.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                    Icons.more_vert
                ),
              )
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            Text(
              "Coins:",
              textAlign: TextAlign.center,
            ),
            Text(
              game.getCoins().round().toString(),
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100),
            RawMaterialButton(
              onPressed: () => {setState(game.onClick), startGame()},
              elevation: 2.0,
              child: Container(
                alignment: Alignment.center,
                height: 240.0,
                width: 240.0,
                child: Image.asset(
                  'assets/Coin.png',
                  width: 240.0,
                  height: 240.0,
                  fit: BoxFit.contain,
                ),
              ),
              shape: CircleBorder(),
              padding: EdgeInsets.all(0.0),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ),
    );
  }
}

