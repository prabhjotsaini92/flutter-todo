import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/util/todo_tile.dart';

import 'home_page_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomePageState home_page_state = Get.put(HomePageState());

  @override
  void initState() {
    super.initState();
    home_page_state.homeInit();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      top: false,
      child: Scaffold(
        appBar: const HomeBar(),
        body: HomeBody(),
        floatingActionButton: const HomeFabButton(),
      ),
    );
  }
}

class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text("Todo"));
  }
}

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  final HomePageState homeState = Get.put(HomePageState());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageState>(
      builder: (_) => ListView.builder(
        itemCount: homeState.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: homeState.toDoList[index][0],
            taskCompleted: homeState.toDoList[index][1],
            onChanged: (_) => homeState.checkBoxChanged(index),
            deleteFunction: () => homeState.deleteTask(index),
          );
        },
      ),
    );
  }
}

class HomeFabButton extends StatelessWidget {
  const HomeFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 600
        ? const SmalFab()
        : const LargFab();
  }
}

class SmalFab extends StatelessWidget {
  const SmalFab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageState>(
      builder: (x) => FloatingActionButton(
          onPressed: () {
            x.createNewTask(context);
          },
          child: const Icon(Icons.add)),
    );
  }
}

class LargFab extends StatelessWidget {
  const LargFab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageState>(
      builder: (x) => FloatingActionButton.large(
        onPressed: () {
          x.createNewTask(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
