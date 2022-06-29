import 'package:flutter_bloc/flutter_bloc.dart';

class HomeIndex extends Cubit<int> {
  HomeIndex(initialState) : super(initialState);

  void changeIndex(int newIndex) {
    emit(newIndex);
  }

  int getIndex() {
    return state;
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}
