import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_helloworld/TestingListDataBloc/bloc/bloc.dart';
import 'package:test_helloworld/TestingListDataBloc/models/models.dart';
 

class NewsUi extends StatefulWidget {
  @override
  _NewsUiState createState() => _NewsUiState();
}

class _NewsUiState extends State<NewsUi> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(Fetch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostError) {
          return Center(
            child: Text("Failed to fetch News Data"),
          );
        }
        if (state is PostLoaded) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text("News not Found"),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.posts.length
                  ? BottomLoader()
                  : PostWidget(
                      post: state.posts[index],
                    );
            },
            itemCount: state.hasReachedMax
                ? state.posts.length
                : state.posts.length + 1,
            controller: _scrollController,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Center(
            child: SizedBox(
                width: 33.0,
                height: 33.0,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                ))));
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${post.id}',
        style: TextStyle(color: Colors.green[900], fontFamily: 'Avenir',fontSize: 10.0),
      ),
      title: Text(post.title, style: TextStyle(color: Colors.green[900], fontFamily: 'Avenir', fontSize: 18.0, fontWeight: FontWeight.bold),),
      isThreeLine: true,
      subtitle: Text(post.body, style: TextStyle(color: Colors.green[900], fontFamily: 'Avenir', fontSize: 14.0),),
      dense: true,
    );
  }
}
