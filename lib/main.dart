import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF080910),
        scaffoldBackgroundColor: Color(0xFF080910),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white
          )
        )
      ),
      home: InputPage(),

    );
  }
}

