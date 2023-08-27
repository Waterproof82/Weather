part of 'prefs_bloc.dart';

class PrefsEvent {}

class PrefsIdiomEvent extends PrefsEvent {
  final bool isEnglish;
  PrefsIdiomEvent(this.isEnglish);
}

class PrefsCityEvent extends PrefsEvent {
  final String city;
  PrefsCityEvent(this.city);
}

class PrefsModelEvent extends PrefsEvent {
  final WheatherModel model;
  PrefsModelEvent(this.model);
}
