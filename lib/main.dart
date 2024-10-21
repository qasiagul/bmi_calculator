import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main()  => runApp(BMICalculator());
class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0F101D),
        appBarTheme:AppBarTheme(
          backgroundColor: Color(0xff0F101D),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:InputPage(),
    );
  }
}
