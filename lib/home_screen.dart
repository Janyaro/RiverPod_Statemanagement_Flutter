import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref){
  return 'Understanding Riverpod';
});

final age = Provider<int>((ref){
  return 54;
});

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context ,WidgetRef ref) {
//     final exp = ref.watch(hello);
//     final agegroup = ref.watch(age);
//     return Scaffold(
//       body: Center(
//         child: Text(exp+" "+agegroup.toString() , style: TextStyle(fontSize:30,fontWeight:FontWeight.bold),),
//       ),
//     );
//   }
// }
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
     final exp = ref.watch(hello);
    final agegroup = ref.watch(age);
    return Scaffold(
      body: Center(
        child: Text(exp+" "+agegroup.toString() , style: TextStyle(fontSize:30,fontWeight:FontWeight.bold),),
      ),
    );
  }
}