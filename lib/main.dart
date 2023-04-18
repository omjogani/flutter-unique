import 'package:flutter/material.dart';
import 'package:flutter_unique/screens/wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Unique',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Wrapper(),
    );
  }
}
