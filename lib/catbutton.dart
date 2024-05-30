import 'package:flutter/material.dart';

// This file creates a widget that acts as a calculator button.
// It styles it and sets it to recieve functionality from a method.

Widget catButton(
  String buttonText, Icon buttonIcon, Color buttonColor, void Function()? buttonPressed) {
    return Container(
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: buttonPressed,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: buttonColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonIcon,
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(buttonText,
                  style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ],
        ),
        ),

      );
  }