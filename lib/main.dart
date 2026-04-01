import 'dart:io'; // Pour Platform
import 'package:flutter/material.dart';
  //import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Sera corrigé après 'pub get'
import 'package:model/pages/home_page.dart'; // ATTENTION : vérifiez ce chemin !

void main() {



  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
} // Import FFI
