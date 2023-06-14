import 'dart:math';

class Calculate {
  Calculate({required this.height, required this.weight});
  final double height;
  final double weight;

  double _bmi = 0;
  String CalculateBMI() {
    double temp = (height * 0.3048);
    _bmi = weight / pow(temp, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 30) {
      return 'Obesity';
    } else if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 30) {
      return 'You Have A Higher Body Weight , Make Schedule And Work Hard';
    } else if (_bmi >= 25) {
      return 'You Have A Higher than Normal Body Weight . Try To Exercise More';
    } else if (_bmi >= 18.5) {
      return 'You Have A Normal Body Weight . Good Job';
    } else {
      return 'You Have A Lower than Normal Body Weight . You Can Eat A Bit More';
    }
  }
}
