import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum ShowWidgetsOption { listView, gridView }

class HomeState extends Equatable {
  final ShowWidgetsOption showWidgetsOption;
  final Color colorTheme;
  final String imagePath;

  const HomeState({
    this.colorTheme = Colors.blueAccent,
    this.imagePath = '',
    this.showWidgetsOption = ShowWidgetsOption.gridView,
  });

  HomeState copyWith({
    Color? colorTheme,
    String? imagePath,
    ShowWidgetsOption? showWidgetsOption,
  }) {
    return HomeState(
      colorTheme: colorTheme ?? this.colorTheme,
      imagePath: imagePath ?? this.imagePath,
      showWidgetsOption: showWidgetsOption ?? this.showWidgetsOption,
    );
  }

  @override
  List<Object?> get props => [colorTheme, imagePath, showWidgetsOption,];
}
