import 'package:flutter/material.dart';
import 'package:mariam/utils/colors_app.dart';

abstract class AppTheme {
  static const TextStyle text = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.text,
  );
  static const TextStyle oldPrice = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColor.oldPrice,
    decoration: TextDecoration.lineThrough,
  );
  static const TextStyle review = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.text,
  );
}
