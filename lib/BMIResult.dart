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
      return ("You have OverWeight");
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return ("you have normal weight");
    } else {
      return ("you have under weight");
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
    print(_name + ' vazn ' + _weight + ' ghad' + _height);
    var bmi = BMICalculator(_height, _weight);
    var bmiNumber = bmi.calculate();
    String health = bmi.getHealthStatus();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          
          appBar: AppBar(title:Text('BMI Calculator'),actions: <Widget>[
            IconButton(icon: Icon(Icons.home),onPressed: (){},color: Colors.white ,),
          ],),
            backgroundColor: Colors.teal,
            body: new Container(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Hello',
                      style:
                          TextStyle(color: Colors.white, fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    _name,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.deepPurple,
                        fontSize: 50.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'your bmi is $bmiNumber',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    health,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(width: 50.0, height: 100.0),
                      RotateAnimatedTextKit(
                          onTap: () {
                            print("Tap Event");
                          },
                          text: [
                            bmi.getAdvice()[0],
                            bmi.getAdvice()[1],
                            bmi.getAdvice()[2]
                          ],
                          textStyle:
                              TextStyle(fontSize: 40.0, fontFamily: "Horizon"),
                          textAlign: TextAlign.center,
                          alignment: AlignmentDirectional
                              .center // or Alignment.topLeft
                          ),
                    ],
                  )
                ],
              ),
            )));
  }
}
