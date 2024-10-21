import 'package:flutter/material.dart';

import '../constants.dart';
class BottomButton extends StatelessWidget {

  BottomButton({required this.onTap, required this.buttonText});

  final Function() onTap;
  final String  buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonText,style: kLargeButtonText,)),
        width: double.infinity,
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        height: kBottomContainerHieght,
      ),
    );
  }
}
