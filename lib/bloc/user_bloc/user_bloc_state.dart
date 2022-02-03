part of 'user_bloc_cubit.dart';

abstract class UserBlocState extends Equatable {
  const UserBlocState();

  @override
  List<Object> get props => [];
}

class UserBlocInitial extends UserBlocState {
  @override
  List<Object> get props => [];
}

class UserBlocLoaded extends UserBlocState {
  final User user;
  UserBlocLoaded(this.user);
  @override
  List<Object> get props => [user];
}
