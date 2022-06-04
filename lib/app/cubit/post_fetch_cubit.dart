import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:st_api_app/app/models/fallure_model.dart';
import 'package:st_api_app/app/models/post_model.dart';
import 'package:st_api_app/app/repo/api_repo.dart';

part 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {
  final ApiRepo apiRepo;

  PostFetchCubit({required this.apiRepo}) : super(PostFetchInitial());

  Future<void> fetchPostApi() async {
    emit(PostFetchLoading());
    try {
      final List<Post>? postList = await apiRepo.getPostList();
      emit(PostFetchLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(PostFetchError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }
}
// 
