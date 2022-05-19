import 'package:dice_app/pages/dice_page.dart';
import 'package:dice_app/pages/start_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(DiceGame());

class DiceGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartPage.id,
      routes: {
        StartPage.id: (context) => StartPage(),
        DicePage.id: (context) => DicePage(),
      },
    );
  }
}
