import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculate/components/ReusableCard.dart';
import 'package:bmi_calculate/components/Iconic.dart';
import 'package:bmi_calculate/Constants.dart';
import 'package:bmi_calculate/components/RoundIcon.dart';
import 'Result_page.dart';
import 'package:bmi_calculate/components/BottomButton.dart';
import 'package:bmi_calculate/BMI_Brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculate"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      mTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild:
                      Iconic(mIcon: FontAwesomeIcons.mars, label: "MALE"),
                      mColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      mTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild:
                      Iconic(mIcon: FontAwesomeIcons.venus, label: "FEMALE"),
                      mColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                    ),
                  ),
                ],
              )),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0X59EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 225,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              mColor: kActiveCardColor,
            ),
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      mColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIcon(
                                mRoundIcon: FontAwesomeIcons.minus,
                                mOnPressed: () {
                                  setState(() {
                                    if (weight > 10)
                                      weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10,),
                              RoundIcon(
                                mRoundIcon: FontAwesomeIcons.plus,
                                mOnPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      mColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIcon(
                                mRoundIcon: FontAwesomeIcons.minus,
                                mOnPressed: () {
                                  setState(() {
                                    if (age > 5)
                                      age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10,),
                              RoundIcon(
                                mRoundIcon: FontAwesomeIcons.plus,
                                mOnPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          BottomButton(mLabel: "CALCULATE",mTap: () {

            BMI_Brain cal = BMI_Brain(mheight: height,mweight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Result_page(
              result: cal.bmiCalculate(),
              resultText: cal.getResult(),
              resultInterpretation: cal.getInterpretation(),
            )),);
          },),
        ],
      ),
    );
  }
}


