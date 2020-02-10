import 'package:flutter/material.dart';
import 'package:flutter_random_background/service/random.dart';

const String KEY_GESTURE_DETECTOR = 'gestureDetector';
const String KEY_CONTAINER = 'container';

class RandomBackgroundColorScreen extends StatefulWidget {
  final RandomService randomService;

  const RandomBackgroundColorScreen(
      {Key key, this.randomService = const RandomService()})
      : super(key: key);

  @override
  _RandomBackgroundColorScreenState createState() =>
      _RandomBackgroundColorScreenState(randomService);
}

class _RandomBackgroundColorScreenState
    extends State<RandomBackgroundColorScreen> {
  final RandomService randomService;

  _RandomBackgroundColorScreenState(this.randomService);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: Key(KEY_GESTURE_DETECTOR),
        child: Container(
            key: Key(KEY_CONTAINER),
            decoration: BoxDecoration(color: randomColor),
            child: Center(
              child: Text('Hey there', style: TextStyle(fontSize: 30)),
            )),
        onTap: () => changeColor());
  }

  void changeColor() {
    setState(() {
      randomColor;
    });
  }

  Color get randomColor => randomService.randomColor();
}
