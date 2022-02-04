import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_bloc_state.dart';

class ThemeBlocCubit extends Cubit<ThemeBlocState> {
  ThemeBlocCubit() : super(ThemeBlocState(ThemeData()));

  void changeTheme(ThemeData theme) => emit(ThemeBlocState(theme));

}
