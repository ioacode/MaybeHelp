import 'package:test_helloworld/TestingListDataBloc/api/news_provider.dart';
import 'package:test_helloworld/TestingListDataBloc/models/models.dart';

class ApiNewsRepository{
  final ApiNewsProvider _apiNewsProvider = ApiNewsProvider();

  Future<List<Post>> fetchNews(index, limit) => _apiNewsProvider.fetchPosts(index, limit);
}
