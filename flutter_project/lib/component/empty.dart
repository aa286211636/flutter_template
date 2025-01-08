import 'package:flutter/material.dart';
import 'package:flutter_project/style/text_style.dart';

class EmptyWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final double imageWidth;
  final double imageHeight;
  final TextStyle textStyle;

   EmptyWidget({
    super.key,
    required this.imagePath,
    required this.text,
    this.imageWidth = 198,
    this.imageHeight = 134,
    TextStyle? textStyle,
  }) : textStyle = textStyle ?? TextStyleUtils.ts_666_normal(16);  


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: imageWidth,
            height: imageHeight,
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
