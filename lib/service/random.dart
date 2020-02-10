import 'dart:math';

import 'package:flutter/material.dart';

class RandomService {
  const RandomService();

  Color randomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
