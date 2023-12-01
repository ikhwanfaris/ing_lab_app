import 'package:flutter/material.dart';

class AppStyles {
  TextStyle heading1 = const TextStyle(
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5);
  TextStyle heading2 = const TextStyle(fontSize: 15, color: Colors.grey);
  TextStyle heading3 = const TextStyle(
      fontSize: 15,
      color: Color.fromRGBO(72, 216, 255, 1),
      letterSpacing: -0.5,
      fontWeight: FontWeight.w800);
  TextStyle heading4 = const TextStyle(
      fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
  TextStyle heading5 = const TextStyle(
      fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);
  TextStyle heading6 = const TextStyle(
      fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
  TextStyle heading7 =
      const TextStyle(fontSize: 15, color: Colors.grey, letterSpacing: -0.5);
}

var styles = AppStyles();
