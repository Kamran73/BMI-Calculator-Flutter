import 'package:flutter/material.dart';
import 'mainUI.dart';
import 'SecondUI.dart';
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF111639),
        scaffoldBackgroundColor: Color(0xFF0a0d22),
      ),
      title: 'BMI Calculator',
      routes: {
        '/': (context) => MyApp(),
        '/second': (context) => Second(),
      },
    ),
  );
}