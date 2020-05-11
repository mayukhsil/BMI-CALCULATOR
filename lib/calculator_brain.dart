import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});

  final int weight;
  final int height;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    }
    else if (_bmi > 18.5) {
      return 'NORMAL';
    }
    else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to Exercise more!';
    }
    else if (_bmi > 18.5) {
      return 'You have a Normal body weight. Good Job!';
    }
    else {
      return 'You have a lower than normal body wwight. You can eat a bit more.';
    }
  }
}