part of 'theme_bloc_cubit.dart';

class ThemeBlocState extends Equatable {
  final ThemeData themeData;
  const ThemeBlocState(this.themeData);

  @override
  List<Object> get props => [themeData];
}


