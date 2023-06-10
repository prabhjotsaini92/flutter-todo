import 'package:get/get.dart';

class SettingsPageState extends GetxController {
  List<String> themeList = ["Dark", "Light", "System"].obs();

  void onRadioClick(Object? val, int index) {
    themeList[index] = val.toString();
  }
}
