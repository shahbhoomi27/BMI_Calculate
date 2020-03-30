import 'package:flutter/material.dart';
import 'package:bmi_calculate/components/BottomButton.dart';
import 'package:bmi_calculate/Constants.dart';
import 'package:bmi_calculate/components/ReusableCard.dart';

class Result_page extends StatelessWidget {
  final String result;
  final String resultText;
  final String resultInterpretation;

  Result_page({this.result, this.resultText, this.resultInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Result"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              flex: 5,
              child: ReusableCard(
                mColor: kActiveCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(resultText,style: kTextStyle,),
                    Text(
                      result,
                      style: kNumberTextStyle.copyWith(
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      resultInterpretation,
                      textAlign: TextAlign.center,
                      style: kLabelStyle.copyWith(
                        color: Colors.white,
                      ),),
                  ],
                ),
              )
          ),
          Expanded(
              flex: 1,
              child: BottomButton(
                mLabel: "RE-CALUCULATE",
                mTap: (){
                  Navigator.pop(context);
                },
              )),
        ],
      ),
    );
  }
}


