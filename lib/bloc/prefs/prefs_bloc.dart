import 'package:bloc/bloc.dart';
import 'package:weather/models/wheather.dart';

part 'prefs_event.dart';
part 'prefs_state.dart';

class PrefsBloc extends Bloc<PrefsEvent, PrefsState> {
  PrefsBloc() : super(const PrefsState(city: 'Londres', isEnglish: true)) {
    on<PrefsIdiomEvent>((event, emit) {
      emit(PrefsState(isEnglish: event.isEnglish, wheatherModel: state.wheatherModel, city: state.city));
    });
    on<PrefsCityEvent>((event, emit) {
      emit(PrefsState(city: event.city));
    });

    on<PrefsModelEvent>((event, emit) {
      emit(PrefsState(isEnglish: state.isEnglish, city: state.city, wheatherModel: event.model));
    });
  }
}
