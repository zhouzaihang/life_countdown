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
        primarySwatch: Colors.blue,
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
        title: Text(DateTime.now().toString().substring(0, 10)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: <Widget>[
            Grid(life: widget.life),
            Text(widget.life.pastLife().toString()),
          ],
        ),
      ),
    );
  }
}
