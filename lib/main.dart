import 'package:bmi_calculator/BMIResult.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'BMI Calculator', home: FirstPage());
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
        body: Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'name',
                prefixIcon: Icon(Icons.person),
              ),
              textAlign: TextAlign.left,
              controller: nameControl,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'weight',
                prefixIcon: Icon(Icons.fastfood),
              ),
              textAlign: TextAlign.left,
              controller: weightControl,
              style: TextStyle(color: Colors.black),
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'height',
                prefixIcon: Icon(Icons.assessment),
              ),
              textAlign: TextAlign.left,
              controller: heightControl,
              style: TextStyle(color: Colors.black),
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
            child: MyButton(
                'Calculate', nameControl, heightControl, weightControl),
          ),
        ],
      ),
    ));
  }
}

class MyButton extends StatefulWidget {
  var nameController = new TextEditingController();
  var heightController = new TextEditingController();
  var weightController = new TextEditingController();

  var buttonName = "";

  MyButton(this.buttonName, this.nameController, this.heightController,
      this.weightController);

  @override
  _MyButtonState createState() => _MyButtonState(
      buttonName, nameController, heightController, weightController);
}

class _MyButtonState extends State<MyButton> {
  var nameController = new TextEditingController();
  var heightController = new TextEditingController();
  var weightController = new TextEditingController();
  var buttonName = "";

  _MyButtonState(this.buttonName, this.nameController, this.heightController,
      this.weightController);

  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      nameController = this.nameController;
      heightController = this.heightController;
      weightController = this.weightController;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.indigo,
      elevation: 3.0,
      shadowColor: Colors.indigo,
      borderRadius: BorderRadius.circular(27.0),
      child: new MaterialButton(
          onPressed: () {
            print(this.heightController.text);
            print(this.weightController.text);
            print(this.nameController.text);
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new BMIResult(
                        this.nameController.text,
                        this.heightController.text,
                        this.weightController.text)));
          },
          minWidth: 250.0,
          height: 45.0,
          elevation: 3.0,
          splashColor: Colors.indigo,
          child: Text(
            '${widget.buttonName}',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          )),
    );
  }
}