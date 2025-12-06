import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';

final counter = StateProvider<int>((ref){
  return 0;
});

final switchProvider = StateProvider((ref){
  return false;
});
class CounterExample extends ConsumerWidget {
  const CounterExample({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    
    print("Build state");
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            builder:(context,ref,child){
              final count = ref.watch(counter);
              print("build state3");
              return Center(
            child: Text(count.toString() , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
          ); 
            }),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: (){
                  ref.read(counter.notifier).state++;
                },
                child: Text('Increment' , style: TextStyle(color: Colors.white),)),
                SizedBox(width: 30,),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: (){
                  ref.read(counter.notifier).state--;
                },
                child: Text('Decrement' , style: TextStyle(color: Colors.white),)),
                
            ],
          ),
          Consumer(builder: (context,ref, child){
            final swi = ref.watch(switchProvider);
            print('build2');
            return   Switch(value: swi, onChanged: (value){
              ref.read(switchProvider.notifier).state = value;
            });
          })
        ],
      ),
    );
  }
}