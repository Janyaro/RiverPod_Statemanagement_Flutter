import 'package:flutter_riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<searchNotifier, SearchClass>((ref){
  return searchNotifier();
});
class searchNotifier extends StateNotifier<SearchClass>{
  searchNotifier():super(SearchClass(search: '' , isChange: false));

  void search(String query){
     state = state.copyWith(search: query);
  }
  void onChange(bool valu){
    state = state.copyWith(isChange: valu);
  }
}

class SearchClass {
  final String search;
  final bool isChange;
  SearchClass({required this.search , required this.isChange});

  SearchClass copyWith({
    String? search ,
    bool? isChange
  }){
    return SearchClass(
      search: search ?? this.search ,
      isChange: isChange ?? this.isChange);
  }

}