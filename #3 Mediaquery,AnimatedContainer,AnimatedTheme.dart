import 'dart:ui';

import 'package:flutter/material.dart';

class Myapp extends StatefulWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF1A0C4B),
        primaryColorLight: Colors.pink,
        accentColor: Colors.black,
      ),
      title: "hello",
      home: Mainpage(),
    );
  }
}

class Mainpage extends StatefulWidget {
  Mainpage({
    Key key,
  }) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  double value = 20;
  bool islight = true;

  animatepadding() {
    setState(() {
      // you can use this stytax also value == 20 ? value = 100 : value = 20;
      value = value == 20 ? 100 : 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Mediaquery has to be the child of MatericalApp so create widget and assign it to home properties and then
    //uses the MediaQuery.of(context).size under the build method of the newly created widget i.e Mainpage() here
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "hi",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Constrainedbox used to set min,max -height and width,but why we need it if we can set height and width
            ///under container properties by default container takes the child size however
            /// constrainedbox helps to set own min,max- height and width.It helps to fit images,wrap text on certain height and width
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 100,
                minWidth: size.width * 0.30,
                maxHeight: 100,
                maxWidth: 200,
              ),
              child: Container(
                color: Colors.red,
                child: Text(
                  "lorem ipsum",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedContainer(
              padding: EdgeInsets.all(value),
              duration: Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
              child: InkWell(
                onTap: () => animatepadding(),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                ),
              ),
            ),
            Theme(
              data: ThemeData(
                primaryColor: Colors.red,
              ),
              child: Container(
                height: 100,
                width: 100,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //use Builder to make use of the animated theme.
            // Dont set container color directly instead set it by Theme.of(context).primaryColor
            AnimatedTheme(
              duration: Duration(seconds: 3),
              curve: Curves.easeInQuint,
              data: islight ? ThemeData.light() : ThemeData.dark(),
              child: Builder(builder: (context) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      islight = !islight;
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Theme.of(context).primaryColorDark,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(Myapp());
