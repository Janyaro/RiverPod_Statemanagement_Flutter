import 'package:flutter_riverpod/legacy.dart';

final todoProvider = StateNotifierProvider<TodoStateProvider , List<TaskModel>>((ref){
  return TodoStateProvider();
});

class TodoStateProvider extends StateNotifier<List<TaskModel>>{
 
 TodoStateProvider():super([]);

 void addTodo(String title , String description){
  int id = 1;
 final item = TaskModel(id: id++, title: title, description: description);
  state.add(item);
  state = state.toList();
 }
 void removeTodo(int index){
  state.removeWhere((item) => item.id == index);
  state = state.toList();
 }
}

class TaskModel {
  final int id;
  final String title;
  final String description;

  TaskModel( {required this.id, required this.title , required this.description});
 
 TaskModel copyWith({String? title , String? description , int? id }){
  return TaskModel(
    id:id ?? this.id,
    title: title ?? this.title, 
    description: description ?? this.description);
 }
}