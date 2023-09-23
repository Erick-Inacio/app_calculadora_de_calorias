import 'package:app_imc/screens/user.dart';
import 'package:app_imc/themes/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Imc());
}

class Imc extends StatelessWidget {
  const Imc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      themeMode: ThemeMode.light,
      home: const UserData(),
    );
  }
}
