import 'package:bmi_calculator/calculator_brian.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';


class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {

   int height = 180;
   int weight = 60;
   int age = 20;
   Color maleCardColor = kInactiveCardColor;
   Color femaleCardColor = kInactiveCardColor;

   void updateColour(int gender){
     // male card pressed
     if(gender == 1){
       if(maleCardColor == kInactiveCardColor){
         maleCardColor = kActiveCardColor;
         femaleCardColor = kInactiveCardColor;
       }else{
         maleCardColor = kInactiveCardColor;
       }
     }

     // female card pressed
     if(gender == 2){
       if(femaleCardColor == kInactiveCardColor){
         femaleCardColor = kActiveCardColor;
         maleCardColor = kInactiveCardColor;
       }else{
         femaleCardColor = kInactiveCardColor;
       }
     }

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseableCard(
                    onPress: () {
                      setState(() {
                        updateColour(1);
                      });
                    },
                    colour:maleCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseableCard(
                    onPress: () {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    colour:femaleCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseableCard(
                    onPress: () {  },
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT',style: kLabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            activeColor:Color(0xffeb1555),
                            inactiveColor: Color(0xff8d8e98),
                            onChanged:(double newValue){
                              setState(() {
                                height = newValue.round();
                              });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseableCard(
                    onPress: () {  },
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',style: kLabelTextStyle,),
                        Text(weight.toString(),style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                onPress: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseableCard(
                    onPress: () {  },
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',style: kLabelTextStyle,),
                        Text(age.toString(),style:kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrian calc = CalculatorBrian(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    interpretation: calc.getResult(),
                    resultText: calc.getInterpretation(),
                  )
              ));
            },
            buttonText: 'CALCULATE',)
        ],
      ),
    );
  }
}

