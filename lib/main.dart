import 'package:flutter/material.dart';
import 'start_page.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Roll the dice'),
      ),
      body: StartPage(),
    ),
  ));
}

