import 'package:dice_app/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatefulWidget {
  static const String id = 'dice_page';

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int playerNumber;
  int randomNumber = Random().nextInt(12 - 3) + 3;

//When the player rolles the dice
  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; //add + 1 so I never get 0
      rightDiceNumber = Random().nextInt(6) + 1;
      playerNumber = leftDiceNumber + rightDiceNumber;
    });
  }

  List<Widget> scoreKeeper = [];
  List<int> scoreKeeperNum = [];

  bool checkScore() {
    List<int> ones = scoreKeeperNum.where((number) => number == 1).toList();
    List<int> zeros = scoreKeeperNum.where((number) => number == 0).toList();

    if (ones.length > zeros.length) {
      return true;
    }

    return false;
  }

  AlertDialog endGameMessage({String endText}) {
    return AlertDialog(
      title: Text('GAME OVER'),
      content: Text(endText),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return StartPage();
            }),
          ),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return DicePage();
            }),
          ),
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
                if (scoreKeeper.length < 3)
                  {
                    if (playerNumber >= randomNumber)
                      {
                        //Add check icon to the score keeper
                        scoreKeeper.add(Icon(
                          Icons.check_box_rounded,
                          color: Colors.green,
                        )),
                        //Add a 1 to the score keeper number
                        scoreKeeperNum.add(1)
                      }
                    else
                      {
                        //Add cross to the score
                        scoreKeeper.add(Icon(
                          Icons.close,
                          color: Colors.red,
                        )),
                        //Add a 0 to the score
                        scoreKeeperNum.add(0)
                      }
                  }
                else
                  {
                    if (checkScore())
                      {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              endGameMessage(endText: 'YOU WIN. Play again?'),
                        ),
                      }
                    else
                      {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => endGameMessage(
                              endText: 'YOU LOSE. Feeling lucky? Play again!'),
                        ),
                      }
                  }
              }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Text(
                '$randomNumber',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 30.0),
              ),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 5.0),
              ),
            ),
            Row(
              children: [
                newDice(diceNum: leftDiceNumber),
                newDice(diceNum: rightDiceNumber)
              ],
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
      ),
    );
  }
}
