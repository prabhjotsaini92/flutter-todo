import 'package:flutter/material.dart';
import 'package:todo/pages/home/my_home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // initalize hive
  await Hive.initFlutter();

  // open the box
  var listBox = await Hive.openBox("listBox");

  // Main app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color color = Colors.red;
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          colorSchemeSeed: color,
          brightness: Brightness.light,
          useMaterial3: true),
      darkTheme: ThemeData(
          colorSchemeSeed: color,
          brightness: Brightness.dark,
          useMaterial3: true),
      home: const AppContainer(),
    );
  }
}

class AppContainer extends StatelessWidget {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}
