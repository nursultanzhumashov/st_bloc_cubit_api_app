import 'package:st_api_app/app/models/post_model.dart';
import 'package:st_api_app/app/data/api_service.dart';

class ApiRepo {
  const ApiRepo({
    required this.apiService,
  });
  final ApiService apiService;

  Future<List<Post>?> getPostList() async {
    final response = await apiService.getPostData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((singlePost) => Post.fromMap(singlePost)).toList();
    }
  }
}
