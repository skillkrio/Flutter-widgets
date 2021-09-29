import "package:flutter/material.dart";

class MyApp extends StatelessWidget {
  final String title = "ListView";
  List names = ["skill", "krish", "krigare", "skill", "krish", "krigare"];

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
        body: ListView.builder(
          //by default scrolldirection are in vertical you can change if you wish
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(9),
              child: Text(
                names[index],
                style: TextStyle(fontSize: 30),
              ),
            );
          },
        ),
        // You can also use this ListView(children: [anywidget],but you need to enter manually here
      ),
    );
  }
}

void main() => runApp(MyApp());
