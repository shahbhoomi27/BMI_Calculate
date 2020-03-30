import 'package:flutter/material.dart';
import 'package:bmi_calculate/Constants.dart';
class RoundIcon extends StatelessWidget {
  RoundIcon({this.mRoundIcon, this.mOnPressed});

  final IconData mRoundIcon;
  Function mOnPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: mOnPressed,
      elevation: 6,
      child: Icon(mRoundIcon),
      shape: CircleBorder(),
      fillColor: kFabBgColor,
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
    );
  }
}