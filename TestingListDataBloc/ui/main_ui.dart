import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_helloworld/TestingListDataBloc/bloc/bloc.dart'; 
import 'package:test_helloworld/TestingListDataBloc/ui/news_ui.dart';
 

class MainListDatat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('News'),
          backgroundColor: Colors.green[600]
        ),
        body: BlocProvider(create: (context) => PostBloc()..add(Fetch()),
          child: NewsUi(),
        ),   

        backgroundColor: Colors.green[100],  
      ), 
    );
  }
}