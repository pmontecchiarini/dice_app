import 'package:dice_app/start_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; //add + 1 so I never get 0
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Text(
              '6',
              style: TextStyle(
                  decoration: TextDecoration.none, color: Colors.white),
            ),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 10.0),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                    onPressed: () => {changeDiceFace()},
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                    onPressed: () => {changeDiceFace()},
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: TextButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StartPage();
                  }),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
