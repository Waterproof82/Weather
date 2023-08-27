part of 'prefs_bloc.dart';

class PrefsState {
  final bool? isEnglish;
  final String? city;
  final WheatherModel? wheatherModel;

  const PrefsState({
    this.isEnglish,
    this.city,
    this.wheatherModel,
  });
}
