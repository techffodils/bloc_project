part of 'post_bloc.dart';

@immutable
sealed class PostState {}

abstract class PostsActionState extends PostState{}

final class PostInitial extends PostState {}

class PostFetchingSuccessfulState extends PostState {
  final List<PostDataModel> posts;

  PostFetchingSuccessfulState({required this.posts});
}
class PostFetchingLoadingState extends PostState{}
class PostFetchingErrorState extends PostState{}

class PostAddintionSuccessState extends PostsActionState{}
class PostAddintionErrorState extends PostsActionState{}

