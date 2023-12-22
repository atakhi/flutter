import 'package:another_app/gradient_container.dart';
import 'package:flutter/material.dart';

const colorsArr = [
  Colors.deepPurple,
  Colors.yellowAccent,
];

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colorsArr: colorsArr,
        ),
      ),
    ),
  );
}
