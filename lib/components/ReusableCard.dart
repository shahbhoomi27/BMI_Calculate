import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final Color mColor;
  Function mTap;
  ReusableCard({this.cardChild,this.mColor,this.mTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: mTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: mColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
