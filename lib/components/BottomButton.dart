import 'package:flutter/material.dart';
import 'package:bmi_calculate/Constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({this.mLabel,this.mTap});

  final String mLabel;
  Function mTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: mTap,
      child: Container(
        child: Center(child: Text(mLabel,style: kLargeButtonStyle,)),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80,
        color: kBottomContainerColor,
      ),
    );
  }
}