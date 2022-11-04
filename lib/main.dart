import 'package:flutter/material.dart';

import 'package:user_configuration_basic/screens/user_settings_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hola',
      home: UserSettingsScreen(),
    );
  }
}
