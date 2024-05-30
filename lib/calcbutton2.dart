import 'package:flutter/material.dart';

// This file creates a widget that acts as a calculator button.
// It styles it and sets it to recieve functionality from a method.

Widget calcButton2(
  Color buttonColor, void Function()? buttonPressed) {
    return Container(
      width: 70,
      height: 70,
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: buttonPressed,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))),
          backgroundColor: buttonColor),
        child: Icon(Icons.backspace_outlined)
      ), 
    );
  }