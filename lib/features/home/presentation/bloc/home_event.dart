import 'package:flutter/material.dart';
import 'package:settings_app/features/home/presentation/bloc/home_state.dart';

abstract class HomeEvent {}

class ChangeColor extends HomeEvent {
  final Color colorTheme;

  ChangeColor({required this.colorTheme});
}

class UploadImage extends HomeEvent {}

class SelectListViewType extends HomeEvent {
  final ShowWidgetsOption showWidgetsOption;

  SelectListViewType({required this.showWidgetsOption});
}
