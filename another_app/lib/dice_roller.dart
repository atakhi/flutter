import 'package:flutter/material.dart';
import 'dart:math';

final ran = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImg = 'assets/images/dice-3.png';
  var currentNum = 2;
  void onPressed() {
    setState(() {
      currentNum = ran.nextInt(6) + 1;
      print('found');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentNum.png',
          width: 200,
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              )),
          child: const Text(
            'Roll Dice!',
          ),
        )
      ],
    );
  }
}
