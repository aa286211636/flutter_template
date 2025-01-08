import 'dart:math';

import 'package:flutter/material.dart';

class ColorStyle {
  static Color mainColor = Colors.blue;
  static Color mainBgColor = const Color(0xFFFFFFFF);
  static Color separatorColor = const Color(0xFFF3F3F3);
  static Color font999Color = const Color(0xFF999999);
  static Color font333Color = const Color(0xFF333333);
  static Color font666Color = const Color(0xFF666666);

  static Color getRandomColor() {
    Random random = Random();
    int alpha = random.nextInt(256);
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    return Color.fromARGB(alpha, red, green, blue);
  }
}
