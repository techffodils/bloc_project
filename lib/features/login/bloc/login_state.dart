part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

abstract class LoginActionState extends LoginState {}

final class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginData;

  LoginSuccessState({required this.loginData});
}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginLoadingState extends LoginState{}
