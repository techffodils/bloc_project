import 'package:bloc_project/features/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
 

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final LoginBloc loginBloc = LoginBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
        listenWhen: (previous, current) => current is LoginActionState,
        buildWhen: (previous, current) => current is! LoginActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoginLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case LoginErrorState:
              final error = state as LoginErrorState;
              return SnackBar(content: Text(error.errorMessage));

            case LoginSuccessState:
              final successState = state as LoginSuccessState;
              return SnackBar(
                  content: Column(
                children: [
                  Text(successState.loginData.fullName),
                  Text(successState.loginData.status.toString()),
                ],
              ));

            default:
          }
          return Center(
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: 'email'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(hintText: 'password'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            LoginDataEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
