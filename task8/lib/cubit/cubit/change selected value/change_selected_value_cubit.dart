import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_selected_value_state.dart';

class ChangeSelectedValueCubit extends Cubit<ChangeSelectedValueState> {
  ChangeSelectedValueCubit() : super(ChangeSelectedValueInitial());

  int selectedindex = 0;

  void changeIndex(int index) {
    selectedindex = index;

    emit(ChangeSelectedValueInitial());
  }
}