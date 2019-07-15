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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Life _life = Life(DateTime(2000, 01, 01));

  void showDefaultYearPicker(BuildContext context) async {
    final DateTime dateTime = await showDatePicker(
      context: context,
      initialDate: _life.birthDay,
      firstDate: DateTime(1950, 1),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    if (dateTime != null && dateTime != this._life.birthDay) {
      setState(() {
        this._life.birthDay=dateTime;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                showDefaultYearPicker(context);
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: <Widget>[
            Grid(life: this._life),
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
                      this._life.pastLife().toString() +
                          " / " +
                          this._life.life.toString(),
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
