import 'dart:math';
class CalculateBMI {

  final int weight;
  final int height;

  double _BMI;

  CalculateBMI(this.weight,this.height);



  String getBMI(){

    _BMI = weight / pow(height/100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getResult(){
    if (_BMI >= 25)
      return 'Overweight';

    else if (_BMI >= 18.5)
      return 'Normal';

    else
      return 'Underweight';
  }

  String getInterpretation(){
    if (_BMI >= 25)
      return 'Exercise more';

    else if (_BMI >= 18.5)
      return 'Maintain';

    else
      return 'Eat more';
  }


}