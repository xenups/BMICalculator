import 'package:flutter/material.dart';

import 'BMIResult.dart';

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
      color: Colors.redAccent,
      elevation: 3.0,
      shadowColor: Colors.redAccent,
      borderRadius: BorderRadius.circular(27.0),
      child: new MaterialButton(
          onPressed: () {
            if (weightController.text != null ||
                heightController.text != null ||
                nameController.text != null) {
              if (double.parse(heightController.text) < 1 ||
                  double.parse(heightController.text) > 300 ||
                  double.parse(weightController.text) < 1 ||
                  double.parse(weightController.text) > 500) {
                print('error');
              } else {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new BMIResult(
                            this.nameController.text,
                            this.heightController.text,
                            this.weightController.text)));
              }
            }
          },
          minWidth: 250.0,
          height: 45.0,
          elevation: 3.0,
          splashColor: Colors.red,
          child: Text(
            '${widget.buttonName}',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          )),
    );
  }
}
