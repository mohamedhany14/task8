import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radiotogle_state.dart';

class RadiotogleCubit extends Cubit<RadiotogleState> {
  RadiotogleCubit() : super(RadiotogleInitial());
  int currentval = 0;
  void togleradios(value) {
    currentval = value;
    emit(RadiotogleInitial());
  }
}
