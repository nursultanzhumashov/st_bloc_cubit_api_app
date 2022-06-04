import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response?> getPostData() async {
    try {
      final Response? response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      print(response.toString());
      return response;
    } catch (err) {
      print("Error :$err");
    }
  }
}
