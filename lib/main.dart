import 'package:flutter/material.dart';
import '../home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../transaction_data.dart';
import 'package:provider/provider.dart';

void main() async {

  // initialize hive
  await Hive.initFlutter();

  // open the box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => const MaterialApp(
        title: "p1",
          debugShowCheckedModeBanner: false,
          home: Home(),
        ),
    ); 
  }
}

