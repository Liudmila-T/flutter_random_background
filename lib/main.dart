import 'package:flutter/material.dart';
import 'package:flutter_random_background/view/random_background_color_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: RandomBackgroundColorScreen()),
    );
  }
}
