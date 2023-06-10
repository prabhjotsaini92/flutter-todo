import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemeState extends GetxController {
  Color appColor = Colors.purple;
  ThemeMode appTheme = ThemeMode.system;

  void changeColorScheme(Color color) {
    appColor = color;
    update();
  }

  void changeThemeMode(ThemeMode theme) {
    appTheme = theme;
    update();
  }
}
