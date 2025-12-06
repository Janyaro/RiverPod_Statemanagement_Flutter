import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/Provider_class/search_provider.dart';
import 'package:learn_riverpod/Provider_class/slider_class.dart';

class SearchExample extends ConsumerWidget {
  const SearchExample({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    
    print("build ");
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Text',
                border: OutlineInputBorder()
              ),
              onChanged: (value){
                ref.read(searchProvider.notifier).search(value);
              },
            ),
            Consumer(builder: (context, ref,child){
              
              final searchValue = ref.watch(searchProvider.select((state) => state.search));
              print('yeh ab hoga kam');
              return Text(searchValue);
            }),
            Consumer(builder: (context,ref,child){
              print('Search Provider');
              final searchValue = ref.watch(searchProvider.select((state) => state.isChange));
              return Switch(value: searchValue, onChanged: (val){
              ref.read(searchProvider.notifier).onChange(val);
              });
            
            })
            
            
          ],
        ),
      ),
    );
  }
}