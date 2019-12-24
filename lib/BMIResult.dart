import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BMICalculator {
  var _height, _weight, _bmi;

  BMICalculator(this._height, this._weight) {
    _bmi = ((double.parse(weight) / pow(double.parse(height), 2)) * 10000);
  }

  get weight => _weight;

  set weight(value) {
    _weight = value;
  }

  get height => _height;

  set height(value) {
    _height = value;
  }

  String calculate() {
    return _bmi.toStringAsFixed(2);
  }

  String getHealthStatus() {
    if (_bmi > 25) {
      return ("You are OverWeight");
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return ("You are Normal weight");
    } else {
      return ("You are Under weight");
    }
  }

  List<String> getAdvice() {
    List<String> advices = new List<String>();
    if (_bmi > 25) {
      advices.add("Dont eat snacks");
      advices.add("Do Exercise");
      advices.add("Put the phone off");
      return advices;
    } else if (_bmi >= 18.5 && _bmi < 25) {
      advices.add("You looks Good");
      advices.add("Handsome");
      advices.add("Great Job");
      return advices;
    } else {
      advices.add("Eat snacks");
      advices.add("Do Exercise");
      advices.add("Do a Cake Party");
      return advices;
    }
  }
}

class BMIResult extends StatefulWidget {
  var _name;
  var _height;
  var _weight;

  BMIResult(this._name, this._height, this._weight);

  @override
  _BMIResultState createState() =>
      _BMIResultState(this._name, this._height, this._weight);
}

class _BMIResultState extends State<BMIResult> {
  var _name;
  var _height;
  var _weight;

  _BMIResultState(this._name, this._height, this._weight);

  @override
  Widget build(BuildContext context) {
    var bmi = BMICalculator(_height, _weight);
    var bmiNumber = bmi.calculate();
    String health = bmi.getHealthStatus();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: new Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo,
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 300.0,
//              padding: const EdgeInsets.only(top: 50.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0,),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Material(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                color: Colors.indigo,
                                child: IconButton(
                                  padding: EdgeInsets.only(right: 16,left: 10),
                                  icon: Icon(Icons.home,
                                      color: Colors.white, size: 30),
                                  onPressed: () {Navigator.pop(context);},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Hello $_name !',
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 45.0,
                          ),
                          Text(
                            bmi.calculate(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 2.0,left: 15.0,right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 10,
                        height: MediaQuery.of(context).size.width - 50,
                        child: Card(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  top: 20.0, bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                      Text(bmi.getHealthStatus(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.accessibility,
                                        color: Colors.teal,
                                        size: 30.0,
                                      ),
                                      Text(
                                        'Your BMI is :' + bmi.calculate(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.assessment,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                      ColorizeAnimatedTextKit(
                                          text: [
                                            bmi.getAdvice()[0],
                                            bmi.getAdvice()[1],
                                            bmi.getAdvice()[2],
                                          ],
                                          textStyle: TextStyle(
                                            fontSize: 22.0,
//                                              fontFamily: "Horizon"
                                          ),
                                          colors: [
                                            Colors.black,
                                            Colors.black26,
                                            Colors.black45,
                                            Colors.blueGrey,
                                          ],
                                          textAlign: TextAlign.center,
                                          alignment: AlignmentDirectional
                                              .center // or Alignment.topLeft
                                          ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ],
                              )),
                          margin: const EdgeInsets.only(top: 20.0),
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
