import 'package:flutter/material.dart';

class MyBoxContainer extends StatelessWidget {
  const MyBoxContainer(this.height, {super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
