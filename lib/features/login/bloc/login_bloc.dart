import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/features/login/model/login_model.dart';
import 'package:bloc_project/features/login/repos/login_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginDataEvent>(loginDataEvent);
  }

  FutureOr<void> loginDataEvent(
      LoginDataEvent event, Emitter<LoginState> emit) async {
   
    LoginModel value = await LoginRepo.login(
        email: event.email, password:event.password );
    if (value.status == 200) {
      emit(LoginSuccessState(loginData: value));
    } else {
      emit(LoginErrorState(errorMessage: value.status.toString()));
    }
  }
}
