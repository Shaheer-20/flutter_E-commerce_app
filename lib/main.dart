import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'app_theme.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: HomePage(),
    );
  }
}
