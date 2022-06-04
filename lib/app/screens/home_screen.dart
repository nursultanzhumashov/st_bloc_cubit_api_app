import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st_api_app/app/cubit/post_fetch_cubit.dart';
import 'package:st_api_app/app/models/post_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Center(
        child: BlocBuilder<PostFetchCubit, PostFetchState>(
          builder: (context, state) {
            if (state is PostFetchLoading) {
              return const CircularProgressIndicator();
            } else if (state is PostFetchError) {
              return Text(state.failure.message);
            } else if (state is PostFetchLoaded) {
              final postList = state.postList;
              return postList.isEmpty
                  ? const Text('пост жок')
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        final Post singlePost = postList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(singlePost.id.toString()),
                          ),
                          title: Text(singlePost.title),
                          subtitle: Text(singlePost.body),
                        );
                      },
                    );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
