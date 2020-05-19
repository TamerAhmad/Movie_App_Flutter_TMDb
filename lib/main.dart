import 'package:flutter/material.dart';
import 'package:movies_fsj/app_state.dart';
import 'package:movies_fsj/app_state_provider.dart';
import 'package:movies_fsj/home_page.dart';

main() async {
  runApp(AppStateProvider(
    appState: AppState(),
    child: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final ThemeData base = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
