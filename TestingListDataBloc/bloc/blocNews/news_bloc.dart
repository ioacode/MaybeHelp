import 'dart:async';  
import 'package:bloc/bloc.dart';
import 'package:test_helloworld/TestingListDataBloc/api/news_repository.dart';
import 'package:test_helloworld/TestingListDataBloc/bloc/bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiNewsRepository apiNewsRepository = new ApiNewsRepository();
 
  @override
  get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await apiNewsRepository.fetchNews(0, 20); 
          yield PostLoaded(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostLoaded) {
          final posts = await apiNewsRepository.fetchNews(currentState.posts.length, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostLoaded(
                  posts: currentState.posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostLoaded && state.hasReachedMax;
}

 