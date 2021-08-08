import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class Calculator{
  int height;
  int weight;
  double _bmi;
  Calculator({this.height, this.weight});
  String CalculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String GetResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi <18.5){
      return 'Underweight';
    }
    else return 'Normal';
  }
  String GetInterperception(){
    if(_bmi >= 25){
      return 'You have higher than normal body weight. Try to exercise more.';
    }
    else if(_bmi <18.5){
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
    else return 'You have a normal body weight. Good job.';
  }
}