  import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:learn_riverpod/todo_task/task_model.dart';

  class TodoHomeScreen extends ConsumerStatefulWidget {
    const TodoHomeScreen({super.key});

    @override
    ConsumerState<TodoHomeScreen> createState() => _TodoHomeScreenState();
  }

  class _TodoHomeScreenState extends ConsumerState<TodoHomeScreen> {
    final titleController = TextEditingController();
    final desController = TextEditingController();
    final _formKey= GlobalKey<FormState>();

    
    @override
    Widget build(BuildContext context) {
      final todo = ref.watch(todoProvider);
      return  Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Todo Screen" , style: TextStyle(fontSize: 25, color: Colors.white),),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 30,),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder()
                  ),
                  validator: (val){
                    if(val != null){
                     return "Enter Title ";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  maxLines: 3,
                  controller: desController,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    ref.read(todoProvider.notifier).addTodo(titleController.text.toString() , desController.text.toString());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    
                    decoration: BoxDecoration(
                      color: Colors.deepPurple
                    ),
                    child: Center(
                      child: Text('Add Todo',style: TextStyle(fontSize: 24,color: Colors.white),),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:todo.length ,
                  itemBuilder: (context,index){
                  return ListTile(
                    title: Text(todo[index].title.toString()),
                    trailing: Row(
mainAxisSize: MainAxisSize.min,
children: [
  IconButton(onPressed: (){
    ref.read(todoProvider.notifier).removeTodo(todo[index].id);
  }, icon: Icon(Icons.delete , color: Colors.red,))
],
                    ),
                  );
                })
              ],
            ),
          ))
      );
    }
  }