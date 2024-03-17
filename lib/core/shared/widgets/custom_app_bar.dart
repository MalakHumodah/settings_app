import 'package:flutter/material.dart';

import 'custom_text_style.dart';

AppBar customAppBar(BuildContext context,Color colorSelected,String title){
  return AppBar(
    foregroundColor: Theme.of(context).canvasColor,
    backgroundColor: colorSelected,
    title: headLineText(
      data: title,
      size: 25,
      color: Theme.of(context).canvasColor,
    ),
  );
}