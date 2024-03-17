import 'package:flutter/material.dart';

Text headLineText({
  required String data,
  Color? color,
  double? size,
  String? fontFamily,
}) {
  return Text(
    data,
    style: TextStyle(
      fontSize: size ?? 40,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
      fontFamily: fontFamily,
    ),
  );
}
