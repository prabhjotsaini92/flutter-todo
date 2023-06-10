import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo/util/dialog_box.dart';

import '../settings/my_settings_page.dart';

class HomePageState extends GetxController {
  // text controller
  final _textController = TextEditingController();

  // hive data base for list
  final dataBase = Hive.box("listBox");

  // Todo list
  List toDoList = [].obs;

  // initial data if thear is no data
  void createInitData() {
    toDoList = [
      ["Tap + button", false],
    ];
  }

  // home page init function
  void homeInit() {
    if (dataBase.get("TODOLIST") == null) {
      createInitData();
    } else {
      loadDataBase();
    }
  }

  // load hive data base
  void loadDataBase() {
    toDoList = dataBase.get("TODOLIST");
  }

  // update's hive data base
  void updateDataBase() {
    dataBase.put("TODOLIST", toDoList);
  }

  // Checkbox on press
  void checkBoxChanged(int index) {
    toDoList[index][1] = !toDoList[index][1];
    updateDataBase();
    update();
  }

  // save new task
  void saveNewTask(BuildContext context) {
    toDoList.add([_textController.text, false]);
    _textController.clear();
    Navigator.of(context).pop();
    updateDataBase();
    update();
  }

  void onCancle(BuildContext context) {
    _textController.clear();
    Navigator.of(context).pop();
    update();
  }

  // Delete task
  void deleteTask(int index) {
    toDoList.removeAt(index);
    updateDataBase();
    update();
  }

  // Create new task
  void createNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _textController,
          onSave: () {
            saveNewTask(context);
          },
          onCancel: () {
            onCancle(context);
          },
        );
      },
    );
    update();
  }

  // Open setting Screen
  void settingsScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MySettingsPage()));
    update();
  }
}
