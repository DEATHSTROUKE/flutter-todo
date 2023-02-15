import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/simple_bloc_observer.dart';
import 'app.dart';

void main() {
  // Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}
