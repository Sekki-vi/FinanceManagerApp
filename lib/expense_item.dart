import 'package:flutter/material.dart';

class ExpenseItem {
  final String category;
  final String amount;
  final Icon img;
  final int colorID;
  ExpenseItem({required this.category, required this.amount, required this.img, required this.colorID});
}