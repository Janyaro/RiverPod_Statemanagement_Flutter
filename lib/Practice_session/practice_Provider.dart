import 'package:flutter_riverpod/legacy.dart';
import 'package:learn_riverpod/Examples/counter_example.dart';

final counterProvider = StateNotifierProvider<practiceNotifier , PracticeModel>((ref){
  return practiceNotifier();
});


class practiceNotifier extends StateNotifier<PracticeModel> {
practiceNotifier() : super(PracticeModel(counter: 0, isloading: false));

void incrementCounter (){
  state = state.copyWith(counter: state.counter + 1);
}
void ischange (){
  state =  state.copyWith(isloading: !state.isloading);
  
}
}




class PracticeModel {
  final int counter;
  final bool isloading;

  PracticeModel({required this.counter , required this.isloading});

  PracticeModel copyWith ({int? counter , bool? isloading}){
    return PracticeModel(counter: counter ?? this.counter, isloading: isloading ?? this.isloading);
  }
}