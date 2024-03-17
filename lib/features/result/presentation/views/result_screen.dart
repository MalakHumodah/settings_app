import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/core/shared/widgets/custom_app_bar.dart';
import 'package:settings_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:settings_app/features/home/presentation/bloc/home_state.dart';
import 'package:settings_app/features/result/presentation/widgets/grid_view_widget.dart';
import 'package:settings_app/features/result/presentation/widgets/list_view_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return Scaffold(
      appBar: customAppBar(
        context,
        bloc.state.colorTheme,
        bloc.titleController.text,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: double.parse(bloc.paddingController.text)),
                  child: imageDecoration(
                    double.parse(bloc.radiusController.text),
                    File(bloc.state.imagePath),
                  ),
                ),
                bloc.state.showWidgetsOption == ShowWidgetsOption.listView
                    ? ListViewWidget()
                    : GridViewWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget imageDecoration(double radius, File image) {
  return SizedBox(
    height: 200,
    width: double.maxFinite,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.file(
        image,
        fit: BoxFit.fill,
      ),
    ),
  );
}
