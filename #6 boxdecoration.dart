import "package:flutter/material.dart";

class MyApp extends StatelessWidget {
  final String title = "Boxdecoration";

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
        body: Something(),
      ),
    );
  }
}

class Something extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(30),dont use shape and borderradius at the sametime
          shape: BoxShape.rectangle,
          color: Colors.blueAccent,
          border: Border(
            top: BorderSide(
              color: Colors.red,
              width: 5,
            ),
            left: BorderSide(
              color: Colors.red,
              width: 8,
            ),
          ),

          //set border in one go border: Border.all(color: Colors.deepOrange, width: 5),
          image: DecorationImage(
            image: AssetImage("assets/tweety.png"),
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft,
          ),
        ),
        child: Text(
          "hi friends",
          style: TextStyle(fontSize: 70, color: Colors.black),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
