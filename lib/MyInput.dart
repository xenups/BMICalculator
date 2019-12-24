import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInput extends StatefulWidget {
  var controller = new TextEditingController();
  String hint;
  Icon fieldIcon;
  bool isDigit = false;

  MyInput(this.controller, this.hint, this.fieldIcon, this.isDigit);

  @override
  _MyInputState createState() =>
      _MyInputState(this.controller, this.hint, this.fieldIcon, this.isDigit);
}

class _MyInputState extends State<MyInput> {
  var controller = new TextEditingController();
  String hint = '';
  Icon fieldIcon;
  bool isDigit = false;
  var _formatter;
  var _keyboardType;


  _MyInputState(this.controller, this.hint, this.fieldIcon, this.isDigit);

  @override
  Widget build(BuildContext context) {
    if(isDigit){
       _formatter =[WhitelistingTextInputFormatter.digitsOnly];
       _keyboardType = TextInputType.number;
    }
    else{
      _formatter =[BlacklistingTextInputFormatter(RegExp("[/\\\\]"))];
      _keyboardType = TextInputType.text;
    }
    return new Container(
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: TextField(

            inputFormatters: _formatter,
            keyboardType: _keyboardType,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    const EdgeInsets.only(left: 5.0, top: 15.0, bottom: 8.0),
                hintText: this.hint,
                prefixIcon: this.fieldIcon,
                focusedBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(30.0)),
                enabledBorder: new UnderlineInputBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    borderSide: new BorderSide(color: Colors.black26))),
            textAlign: TextAlign.left,
            controller: widget.controller,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
    ;
  }
}
