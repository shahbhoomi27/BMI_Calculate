import 'package:flutter/material.dart';
import 'package:bmi_calculate/screens/InputPage.dart';

void main() => runApp(BMICalculate());

class BMICalculate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0XFF0A0E21),
          scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}


