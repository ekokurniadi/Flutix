import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'user_bloc_state.dart';

class UserBlocCubit extends Cubit<UserBlocState> {
  UserBlocCubit() : super(UserBlocInitial());

  void loadUser(String id) async {
    User user = await UserServices.getUser(id);
    emit(UserBlocLoaded(user));
  }
}
