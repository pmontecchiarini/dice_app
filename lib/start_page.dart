import 'package:flutter/material.dart';
import 'dice_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'To play the dice game simply tap on the dice to roll them. If your number is equal or higher than the one on the red square, you won!',
                style: TextStyle(fontSize: 25.0, fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Center(
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DicePage();
                    }),
                  );
                },
                icon: Icon(Icons.play_arrow),
                label: const Text('Play',
                    style: TextStyle(fontFamily: 'PressStart2P')),
              ),
            ),
          ),
        )
      ],
    );
  }
}
