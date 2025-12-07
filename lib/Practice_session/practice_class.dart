import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/Practice_session/practice_Provider.dart';

class PracticeClass extends ConsumerWidget {
  const PracticeClass({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    
    print('build here');
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            builder:(context,ref,child){
              final count = ref.watch(counterProvider.select((state)=> state.counter));
              print('Counter build');
              return Center(child: Text(count.toString() , style: TextStyle(fontWeight: FontWeight.bold , fontSize:30 ),));
           
            } ),
          ElevatedButton(onPressed: (){
                     ref.read(counterProvider.notifier).incrementCounter();
                    }, child: Text('Increment')),
        Consumer(builder: (context,ref,child){
          print("Visibility build");
          final count = ref.watch(counterProvider.select((state) => state.isloading));
          return IconButton(onPressed: (){
            ref.read(counterProvider.notifier).ischange();
          }, icon:count ?  Icon(Icons.visibility) : Icon(Icons.visibility_off)); 
        })  
        ],
      ),
    );
  }
}