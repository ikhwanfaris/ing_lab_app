import 'package:flutter/material.dart';
import 'package:ing_lab_app/pages/login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    ),
  );
}
