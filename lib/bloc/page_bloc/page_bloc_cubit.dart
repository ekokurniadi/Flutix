import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_bloc_state.dart';

class PageBlocCubit extends Cubit<PageBlocState> {
  PageBlocCubit() : super(PageBlocInitial());

  void goToSplashPage() => emit(OnSplashPage());
  void goToLoginPage() => emit(OnLoginPage());
  void goToMainPage() => emit(OnMainPage());

}


