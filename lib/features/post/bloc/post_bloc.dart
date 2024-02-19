import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/features/post/models/post_data_model.dart';
import 'package:bloc_project/features/post/repos/post_repo.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    List<PostDataModel> posts = await PostRepo.fetchPost();
    emit(PostFetchingSuccessfulState(posts: posts));
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostState> emit) async {
    bool success = await PostRepo.addPost();
    print(success);
    if (success) {
      emit(PostAddintionSuccessState());
    } else {
      emit(PostAddintionErrorState());
    }
  }
}
