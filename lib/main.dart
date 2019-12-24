import 'package:flutter/material.dart';
import 'MyButton.dart';
import 'MyInput.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController nameControl = new TextEditingController();
  final TextEditingController weightControl = new TextEditingController();
  final TextEditingController heightControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.indigo,
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(top:10.0),
            shrinkWrap: true,

            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Positioned(
                            left: 1.0,
                            top: 2.0,
                            child: Icon(Icons.favorite,
                                color: Colors.black54, size: 40.0),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                            size: 40.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'BMI Calculator',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 30.0,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 15.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 50.0),
                    child:
                        MyInput(nameControl, 'name', Icon(Icons.person), false),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 30.0),
                    child: MyInput(
                        weightControl, 'weight', Icon(Icons.fastfood), true),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 30.0),
                    child: MyInput(
                        heightControl, 'height', Icon(Icons.assessment), true),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 50.0),
                    child: MyButton(
                        'Calculate', nameControl, heightControl, weightControl),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
