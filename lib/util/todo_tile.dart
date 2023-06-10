import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function()? deleteFunction;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: onChanged,
      value: taskCompleted,
      title: Text(
        taskName,
        style: TextStyle(
            decoration: taskCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      secondary:
          IconButton(icon: const Icon(Icons.close), onPressed: deleteFunction),
    );
  }
}

/*
Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              //checkbox
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                ),
              ),
              // task name
              Expanded(
                flex: 20,
                child: Text(
                  taskName,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
              IconButton(
                onPressed: deleteFunction,
                icon: const Icon(Icons.close),
              )
            ],
          ),
        ),
      ),
    );
  }
*/
