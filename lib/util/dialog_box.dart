import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("New Task"),
      content: TextField(
        autofocus: true,
        controller: controller,
        decoration: const InputDecoration(hintText: "Enter yor task"),
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text("Cancle"),
        ),
        TextButton(
          onPressed: onSave,
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
