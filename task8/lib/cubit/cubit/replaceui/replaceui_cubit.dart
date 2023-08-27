import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'replaceui_state.dart';

class ReplaceuiCubit extends Cubit<ReplaceUiState> {
  ReplaceuiCubit() : super(ReplaceUiInitial());

  void showText() {
    emit(ShowText());
  }

  void showCubitImage() {
    emit(ShowCubitImage());
  }

  void showRedCircle() {
    emit(ShowRedCircle());
  }

  void reset() {
    emit(ReplaceUiInitial());
  }
}
