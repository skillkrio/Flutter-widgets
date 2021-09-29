import "package:flutter/material.dart";

class MyApp extends StatelessWidget {
  final String title = "RotatedBox";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        primaryColorLight: Colors.orange,
        accentColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: RotatedBox(
            //
            quarterTurns: 2,
            //0-straight,1-right,2-down,3-left,4-straight and continues on this cycle
            child: Image(
              image: AssetImage("assets/tweety.png"),
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
