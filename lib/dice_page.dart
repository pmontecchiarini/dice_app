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
  int playerNumber;
  int randomNumber = Random().nextInt(12 - 3) + 3;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; //add + 1 so I never get 0
      rightDiceNumber = Random().nextInt(6) + 1;
      playerNumber = leftDiceNumber + rightDiceNumber;
    });
  }

  List<Widget> scoreKeeper = [];

  AlertDialog endGameMessage({String endText}) {
    return AlertDialog(
      title: Text('GAME OVER'),
      content: Text(endText),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }

  Expanded newDice({int diceNum}) {
    return Expanded(
      child: TextButton(
        child: Image.asset('images/dice$diceNum.png'),
        onPressed: () => {
          changeDiceFace(),
          if (playerNumber >= randomNumber)
            {
              //Add check icon to the score keeper
              scoreKeeper.add(Icon(
                Icons.check_box_rounded,
                color: Colors.green,
              )),
              showDialog<String>(
                context: context,
                  builder: (BuildContext context) =>
                      endGameMessage(endText: 'You win. Play again?')
              ),
            }
          else if (playerNumber < randomNumber)
            {
              //Add cross to the scroe
              scoreKeeper.add(Icon(
                Icons.close,
                color: Colors.red,
              )),
              showDialog<String>(
                context: context,
                  builder: (BuildContext context) => endGameMessage(
                      endText: 'You lose. Would you like a rematch?')
              ),
            }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Text(
              '$randomNumber',
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
                newDice(diceNum: leftDiceNumber),
                newDice(diceNum: rightDiceNumber)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: scoreKeeper,
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
