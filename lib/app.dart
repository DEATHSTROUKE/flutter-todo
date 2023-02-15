import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/todo_bloc/view/todo_page.dart';
import 'constants/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: mainBgColor));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: mainMaterialColor, fontFamily: 'Verdana'),
      home: TodoHomePage(),
    );
  }
}
