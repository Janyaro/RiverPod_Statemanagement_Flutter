import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/Examples/login_screen.dart';
import 'package:learn_riverpod/Examples/search_example.dart';
import 'package:learn_riverpod/Practice_session/practice_class.dart';
import 'package:learn_riverpod/todo_task/task_model.dart';
import 'package:learn_riverpod/todo_task/todo_home_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: TodoHomeScreen(),
      ),
    );
  }
}