import 'package:intl/intl.dart';

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}

bool isTextOnly(String text) {
  return RegExp(r'^[a-zA-Z\s]+$').hasMatch(text);
}

bool isValidDate(String date) {
  try {
    DateFormat('dd/MM/yyyy').parseStrict(date);
    return true;
  } catch (e) {
    return false;
  }
}

bool isNumberOnly(String text) {
  return RegExp(r'^[0-9]+$').hasMatch(text);
}

