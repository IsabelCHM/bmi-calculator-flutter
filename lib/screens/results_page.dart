import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String result;
  final String interpretation;


  ResultPage(this.bmiResult, this.result, this.interpretation);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Text('Your Result',
                  style: kTitleTxtStyle,
                ),
              ),
            ),
            Expanded(flex: 5,
                child: NewCard(
              kStdCardColour, Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(result,
                    style: kResultTxtStyle1
                    ),
                    Text(bmiResult,
                    style: kBMITxtStyle,),
                    Text(interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyResultsTxtStyle)

                  ],), (){}
            )),
            BottomButton('RE-CALCULATE', (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                InputPage()
              ));
            })
          ],
        ),
      ),
    );
  }
}
