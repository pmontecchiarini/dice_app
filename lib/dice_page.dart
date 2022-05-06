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

  List<Widget> scoreKeeper = [
    Icon(
      Icons.check_box_rounded,
      color: Colors.green,
    ),
    Icon(
      Icons.crop_square_sharp,
      color: Colors.red,
    )
  ];

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
                Expanded(
                  child: TextButton(
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                    onPressed: () => {
                      changeDiceFace(),
                      if (playerNumber >= randomNumber)
                        {
                          print('$playerNumber + You won'),
                          scoreKeeper.add(Icon(
                            Icons.check_box_rounded,
                            color: Colors.green,
                          )),
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('You won'),
                              content: const Text(
                                  'Are you feeling lucky? Play again!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        }
                      else
                        {
                          print('$playerNumber +  You lose'),
                          scoreKeeper.add(Icon(
                            Icons.crop_square_sharp,
                            color: Colors.red,
                          )),
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('You lose'),
                              content:
                                  const Text('The house wins, play again!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        }
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                    onPressed: () => {
                      changeDiceFace(),
                      if (playerNumber >= randomNumber)
                        {
                          print('$playerNumber + You won'),
                          scoreKeeper.add(Icon(
                            Icons.check_box_rounded,
                            color: Colors.green,
                          )),
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('You won'),
                              content: const Text(
                                  'Are you feeling lucky? Play again!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        }
                      else
                        {
                          print('$playerNumber +  You lose'),
                          scoreKeeper.add(
                            Icon(Icons.crop_square_sharp, color: Colors.red),
                          ),
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('You lose'),
                              content:
                                  const Text('The house wins, play again!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        }
                    },
                  ),
                ),
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
