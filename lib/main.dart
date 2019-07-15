import 'package:flutter/material.dart';
import 'package:life_countdown/grid.dart';
import 'package:life_countdown/life.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Countdown',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(
        life: Life(DateTime.now()),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.life}) : super(key: key);

  final Life life;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    widget.life.birthDay = DateTime(2000, 01, 01);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            DateTime.now().toString().substring(0, 10),
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: "Barriecito"),
          ),
          centerTitle: true,
          elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: <Widget>[
            Grid(life: widget.life),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Container(
                        height: 48, child: Image.asset("asset/iron_man.png")),
                  ),
                  Text(
                      widget.life.pastLife().toString() +
                          " / " +
                          widget.life.life.toString(),
                      style: TextStyle(fontSize: 48, fontFamily: "Barriecito")),
                ],
              ),
            ),
            Text(
              "Stay Hungry \t Stay Foolish",
              style: TextStyle(
                  fontFamily: "Barriecito",
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
