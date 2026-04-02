import 'dart:io';
import 'package:flutter/material.dart';
import 'package:model/pages/home_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Import nécessaire

void main() {
  // INDISPENSABLE POUR WINDOWS
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // Plus simple en Stateless
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}