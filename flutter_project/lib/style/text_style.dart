import 'package:flutter/material.dart';
import 'package:flutter_project/style/color_style.dart';

class TextStyleUtils {
  static TextStyle ts_tab_normal() {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: ColorStyle.font999Color);
  }

  static TextStyle ts_tab_select() {
    return TextStyle(
        fontWeight: FontWeight.w500, fontSize: 16, color: ColorStyle.mainColor);
  }

  static TextStyle ts_main_bold(double fontSize) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: ColorStyle.mainColor,
    );
  }

  static TextStyle ts_main_extrabold(double fontSize) {
    return TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: fontSize,
      color: ColorStyle.mainColor,
    );
  }

  static TextStyle ts_main_normal(double fontSize) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: ColorStyle.mainColor,
    );
  }

  static TextStyle ts_white_normal(double fontsize) {
    return TextStyle(
        fontWeight: FontWeight.w400, fontSize: fontsize, color: Colors.white);
  }

  static TextStyle ts_white_bold(double fontsize) {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: fontsize,
        color: ColorStyle.font333Color);
  }

  static TextStyle ts_333_normal(double fontsize) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontsize,
        color: ColorStyle.font333Color);
  }

  static TextStyle ts_333_bold(double fontsize) {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: fontsize,
        color: ColorStyle.font333Color);
  }

  static TextStyle ts_666_normal(double fontsize) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontsize,
        color: ColorStyle.font666Color);
  }

  static TextStyle ts_666_bold(double fontsize) {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: fontsize,
        color: ColorStyle.font666Color);
  }

  static TextStyle ts_999_normal(double fontsize) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontsize,
        color: ColorStyle.font999Color);
  }

  static TextStyle ts_999_bold(double fontsize) {
    return TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: fontsize,
        color: ColorStyle.font999Color);
  }

  //#333
}
