import 'package:flutter/material.dart';
import 'package:guess_number/number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess The Number',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: Number(),
    );
  }
}