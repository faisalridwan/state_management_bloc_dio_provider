import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_app/blocs/all_post_bloc.dart';
import 'package:state_management_app/blocs/detail_bloc.dart';
import 'package:state_management_app/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => AllPostBloc()),
        ChangeNotifierProvider(builder: (_) => DetailBloc()),
      ],
      child: MaterialApp(
        title: 'State Management',
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: HomePage(),
      ),
    );
  }
}
