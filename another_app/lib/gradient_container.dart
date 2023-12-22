import 'package:another_app/dice_roller.dart';
import 'package:another_app/styled_text.dart';
import 'package:flutter/material.dart';

const leftAlignment = Alignment.topLeft;
const rightAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colorsArr});
  final List<Color> colorsArr;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorsArr,
          begin: leftAlignment,
          end: rightAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
