import "package:flutter/material.dart";

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        primaryColorLight: Colors.amber,
        accentColor: Colors.pink,
      ),
      home: Myhomepage(),
    );
  }
}

class Myhomepage extends StatefulWidget {
  const Myhomepage({
    Key key,
  }) : super(key: key);

  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  String title = "Input Widget";
  //keys are used to connect with the desired form
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: "Enter you first Name",
                  hintText: "hello",
                ),
                validator: (value) {
                  //Validator must return null
                  if (value.isEmpty) {
                    return "Please Enter your First Name";
                  } else
                    return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: "Enter you last Name",
                  hintText: "hello",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter last Name";
                  } else
                    return null;
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (formkey.currentState.validate()) {
                    print("submitted succesfully");
                  }
                },
                child: Text(
                  "Submit",
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
