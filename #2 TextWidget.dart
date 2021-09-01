import "package:flutter/material.dart";

class Myapp extends StatefulWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String apptitle = "hellofriend";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: apptitle,
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        primaryColorLight: Colors.blue,
        accentColor: Colors.amber,
      ),
      home: Mainpage(),
    );
  }
}

class Mainpage extends StatelessWidget {
  const Mainpage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("hello friend"),
      ),
      //Default TExtstyle
      body: Column(
        children: [
          ///Default textstyle let to use its style to all descendants ,we can pass column in the child properites and make use of it
          DefaultTextStyle(
            child: Column(
              //you can add single Text widget without using column

              children: [Text("I am"), Text("inheriting style")],
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.pinkAccent,
              decorationStyle: TextDecorationStyle.wavy,
            ),
          ),

          //Richtext
          RichText(
            text: TextSpan(
                text: "I am rich\n",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontSize: 25,
                ),
                children: [
                  TextSpan(
                    text: "iam poor\n",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(
                    text: "i am a developer",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 40,
                    ),
                  ),
                ]),
          ),

          /// This is a generic Text widget

          Text(
            "I am a developer",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: TextStyle(
              backgroundColor: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          ///There is no much difference between RichText and Text.rich just a little bit syntax difference
          ///RichText are commonly used Widget
          Text.rich(
            TextSpan(
              text: "hello",
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue,
              ),
              children: [
                TextSpan(
                  text: "iam poor\n",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(Myapp());
}
