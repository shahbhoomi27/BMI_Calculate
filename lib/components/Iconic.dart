import 'package:flutter/material.dart';
import 'package:bmi_calculate/Constants.dart';

class Iconic extends StatelessWidget {
  final String label;
  final IconData mIcon;

  Iconic({this.mIcon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          mIcon,
          size: 70,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
