import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:settings_app/features/home/presentation/bloc/home_event.dart';
import 'package:settings_app/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController radiusController = TextEditingController();
  TextEditingController paddingController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  HomeBloc() : super(HomeState()) {
    on<ChangeColor>(_changeColor);
    on<UploadImage>(_uploadImage);
    on<SelectListViewType>(_selectListViewType);
  }

  FutureOr<void> _changeColor(ChangeColor event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      colorTheme: event.colorTheme,
    ));
  }

  FutureOr<void> _uploadImage(
      UploadImage event, Emitter<HomeState> emit) async {
    ImagePicker imagePicker = ImagePicker();

    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      emit(state.copyWith(
        imagePath: image.path,
      ));
    }
  }

  FutureOr<void> _selectListViewType(
      SelectListViewType event, Emitter<HomeState> emit) {
    emit(state.copyWith(showWidgetsOption: event.showWidgetsOption));
  }
}
