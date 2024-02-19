import 'package:bloc_project/features/post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  final PostBloc postBloc = PostBloc();
  void initState() {
    // TODO: implement initState
    super.initState();
    postBloc.add(PostInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostPage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postBloc.add(PostAddEvent());
        },
        child: Icon(Icons.add),
      ),
      body: BlocConsumer<PostBloc, PostState>(
          bloc: postBloc,
          listenWhen: (previous, current) => current is PostsActionState,
          buildWhen: (previous, current) => current is !PostsActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case PostFetchingSuccessfulState:
                final successState = state as PostFetchingSuccessfulState;

                return ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(16),
                      color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(successState.posts[index].title),
                          Text(successState.posts[index].body),
                        ],
                      ),
                    );
                  },
                );
              case PostFetchingLoadingState:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
            ;
            return const SizedBox();
          }),
    );
  }
}
