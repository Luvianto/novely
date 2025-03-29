import 'package:flutter/material.dart';
// import 'package:novely/screens/game_screen.dart';
import 'package:novely/screens/main_menu_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenuScreen(),
    );
  }
}
