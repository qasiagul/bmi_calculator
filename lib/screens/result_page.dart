import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
   ResultPage({required this.bmiResult, required this.interpretation, required this.resultText});

  final String  bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitileTextStyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReUseableCard(
                  onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                           resultText.toUpperCase(),
                            style: kResultTextStyle,
                          ),
                          Text(
                            bmiResult,
                            style: kBMITextStyle,
                          ),
                          Text(
                            interpretation,
                            textAlign: TextAlign.center,
                            style: kBodyTextStyle,
                          ),
                        ]),
                    ),
            ),
            BottomButton(
                onTap: (){
                  Navigator.pop(context);
                },
                buttonText: 'RE-CALCULATE'),

          ],
        ));
  }
}
