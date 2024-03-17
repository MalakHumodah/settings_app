import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:settings_app/core/shared/widgets/custom_button.dart';
import 'package:settings_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:settings_app/features/result/presentation/views/result_screen.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        body: Form(
          key: bloc.formKey,
          child: SafeArea(
            child: ListView(
               children: [
                CustomTextFormField(
                  controller: bloc.titleController,
                  labelText: 'Title',
                 ),
                CustomTextFormField(
                  controller: bloc.paddingController,
                  labelText: 'Padding Size',
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: doubleInputFormatters(),
                 ),
                CustomTextFormField(
                  controller: bloc.radiusController,
                  labelText: 'Radius',
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: doubleInputFormatters(),
                 ),
                CustomElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Pick a Color"),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: bloc.state.colorTheme,
                                onColorChanged: (Color value) {
                                  bloc.add(ChangeColor(colorTheme: value));
                                },
                              ),
                            ),
                          );
                        });
                  },
                  labelButton: 'Select Color',
                ),
                CustomElevatedButton(
                  onPressed: () async {
                    bloc.add(UploadImage());
                  },
                  labelButton: 'Upload Image',
                ),

                state.imagePath.isNotEmpty
                    ? Center(
                        child: Image.file(
                          File(state.imagePath),
                          width: 200,
                          height: 100,
                        ),
                      )
                    : Container(),
                Column(
                  children: [
                    radioOption(bloc.state.showWidgetsOption,
                        ShowWidgetsOption.listView, context),
                    radioOption(bloc.state.showWidgetsOption,
                        ShowWidgetsOption.gridView, context),
                  ],
                ),
                CustomElevatedButton(
                  onPressed: () {
                    if (bloc.formKey.currentState!.validate()) {
                      if (state.imagePath.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please Upload image')),
                        );
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResultScreen()));
                      }
                    }
                  },
                  labelButton: 'View the Result',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

List<TextInputFormatter>? doubleInputFormatters() {
  return [FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))];
}


Widget radioOption(
  ShowWidgetsOption showWidgetsOption,
  ShowWidgetsOption value,
  BuildContext context,
) {
  return ListTile(
    title: Text(value.name),
    leading: Radio<ShowWidgetsOption>(
        value: value,
        groupValue: showWidgetsOption,
        onChanged: (ShowWidgetsOption? value) {
          context
              .read<HomeBloc>()
              .add(SelectListViewType(showWidgetsOption: value!));
        }),
  );
}
