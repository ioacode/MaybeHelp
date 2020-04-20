import 'package:dio/dio.dart';
import 'package:test_helloworld/TestingListDataBloc/models/models.dart';

class ApiNewsProvider{
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';
 
  Future<List<Post>> fetchPosts(int startIndex, int limit) async {
    try{
      final response = await Dio().get('$_baseUrl/posts?_start=$startIndex&_limit=$limit');
      final data = response.data as List;
      return data.map((rawPost) {
        return Post.fromJson(rawPost);
      }).toList();
    }catch(_){
      throw Exception('error fetching posts');
    }
  }
}