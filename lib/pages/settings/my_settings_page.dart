import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app_theme_state.dart';

import 'Settings_page_state.dart';

class MySettingsPage extends StatelessWidget {
  MySettingsPage({super.key});

  final AppThemeState appTheme = Get.put(AppThemeState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: const SettingsBody(),
    );
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsPageState>(
      builder: (_) => ListView.builder(
          itemCount: _.themeList.length,
          itemBuilder: (builder, index) {
            return ThemeTile(
                index: index,
                list: _.themeList,
                onChange: (val) {
                  _.onRadioClick(val, index);
                });
          }),
    );
  }
}

// ignore: must_be_immutable
class ThemeTile extends StatelessWidget {
  final List<String> list;
  final int index;
  final Function(Object?)? onChange;

  const ThemeTile({
    super.key,
    required this.list,
    required this.onChange,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(list[index]),
      value: list[index],
      groupValue: list[index],
      onChanged: onChange,
    );
  }
}
