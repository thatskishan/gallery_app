import 'package:flutter/material.dart';
import 'package:gallery_app/views/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
      },
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigoAccent,
      ),
    ),
  );
}
