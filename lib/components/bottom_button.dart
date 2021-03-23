import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTxt;
  final Function function;

  BottomButton(this.buttonTxt, this.function);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: function,
      child: Container(
        width: double.infinity,
        height: kBottomNavHeight,
        margin: EdgeInsets.only(top: 15),
        color: kBottomContainerColour,
        child: Center(child: Text(buttonTxt,
            style: kBottomTextStyle)),
      ),
    );
  }
}