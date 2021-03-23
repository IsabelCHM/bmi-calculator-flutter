import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/card_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


enum Gender {Male, Female}


class _InputPageState extends State<InputPage> {


  Gender selectedGender;
  int height = 170;
  int weight = 60;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: NewCard(selectedGender == Gender.Male ? kStdCardColour : kInactiveCardColor,
                        GenderCard(FontAwesomeIcons.mars, 'MALE'),
                        () {setState(() {
                          selectedGender = Gender.Male;
                        });
                        }),
                  ),
                  Expanded(
                    child: NewCard(selectedGender == Gender.Female ? kStdCardColour : kInactiveCardColor,
                        GenderCard(FontAwesomeIcons.mars, 'FEMALE'),
                            () {setState(() {
                          selectedGender = Gender.Female;
                        });
                        }),
                  ),
                ],
              ),
            ),
            Expanded(child:NewCard(kStdCardColour, Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',
                style: kLabelTextStyle,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(height.toString(),
                    style: kBigTextStyle),
                    Text('CM',
                    style: kLabelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30)

                  ),
                  child: Slider(value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      activeColor: kSliderActiveColour,
                      inactiveColor: kSliderInactiveColour,
                      onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                      }),
                )

              ],
            ), (){})),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: NewCard(kStdCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',
                          style: kLabelTextStyle,),
                          Text(weight.toString(),
                          style: kBigTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(FontAwesomeIcons.minus, (){
                                setState(() {
                                  weight -= 1;
                                });
                              }),
                              SizedBox(width: 10,),
                              RoundButton(FontAwesomeIcons.plus, (){
                                setState(() {
                                  weight += 1;
                                });
                              }),


                            ],
                          )
                        ],

                  ), (){})),
                  Expanded(child: NewCard(kStdCardColour, Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',
                        style: kLabelTextStyle,),
                      Text(age.toString(),
                        style: kBigTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(FontAwesomeIcons.minus, (){
                            setState(() {
                              age -= 1;
                            });
                          }),
                          SizedBox(width: 10,),
                          RoundButton(FontAwesomeIcons.plus, (){
                            setState(() {
                              age += 1;
                            });
                          }),


                        ],
                      )
                    ],

                  ), (){})),
                ],
              ),
            ),
            BottomButton('CALCULATE', (){
              CalculateBMI bmicalc = CalculateBMI(weight, height);

              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                ResultPage(bmicalc.getBMI(), bmicalc.getResult(), bmicalc.getInterpretation())
              ));
            })
          ],
        ),
      ),

    );
  }
}

