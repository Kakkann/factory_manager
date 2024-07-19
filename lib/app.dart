import 'package:flutter/material.dart';
import 'package:factory_manager/pages/main_view.dart';
import 'package:factory_manager/pages/sidebar.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Sidebar(),
        MainView(
          theme: Theme.of(context),
        ),
      ]),
    );
  }
}
