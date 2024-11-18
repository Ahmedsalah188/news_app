import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;
  String local = "en";

  changeLanguage(String langcode) {
    local = langcode;
    notifyListeners();
  }
}
