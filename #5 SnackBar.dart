import "package:flutter/material.dart";

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "something",
      // I am wrapping Scaffold with ScaffoldMessenger to show snackbar on this current scaffold only
      //If you navigate to other page, the snackbar will disappear.By default it will show on all page after navigation
      home: ScaffoldMessenger(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text("hello"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) => ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        SnackBar snackBar = SnackBar(
                          content: Text("important Snackbar"),
                        );
                        //removeCurrentSnackBar removes current snackbar and shows the current clicked snackbar
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                        // you can use removeCurrentSnackBar() but this will not add "exit animation"
                        //like hideCurrentSnack().click it multiple times to see the difference
                      },
                      child: Text(
                        "import Snackbar",
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        SnackBar snackBar = SnackBar(
                          duration: Duration(days: 500),
                          action: SnackBarAction(
                              label: "dismiss",
                              onPressed: () {
                                //your logic code
                              }),
                          content: Text("Action SnackBar"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text(
                        "Action SnackBar",
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () async {
                        SnackBar snackBar = SnackBar(
                          duration: Duration(seconds: 7),
                          content: Text("Async SnackBar"),
                        );

                        ScaffoldMessenger.of(context)..showSnackBar(snackBar);
                        await Future.delayed(
                          Duration(seconds: 2),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NewPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "ASync SnackBar",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Create this NewPage Widget page on seperate file.just for example i am using this here

class NewPage extends StatelessWidget {
  const NewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

void main() => runApp(MyApp());
