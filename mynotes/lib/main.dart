// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mynotes/views/login_view.dart';

import 'views/homepage_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}
