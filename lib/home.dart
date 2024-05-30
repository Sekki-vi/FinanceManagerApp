
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../calcbutton.dart';
import '../catbutton.dart';
import '../colors.dart';
import '../expense_item.dart';
import '../navbar.dart';
import '../calcbutton2.dart';
import '../home2.dart';
import 'package:math_expressions/math_expressions.dart';
import '../transaction_data.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _myBox = Hive.box('mybox');

  String expression = "";
  int id = 100;
  final int _colorID = 1;

  buttonPressed(String buttonText) {

  setState(() {

      if (buttonText == "<") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }

      } else if (buttonText == "Groceries" || buttonText == "Take-Out" || buttonText == "Clothes" || buttonText == "Relaxation" || buttonText == "Gas" || buttonText == "Phone" || buttonText == "House" || buttonText == "Car") {
        _myBox.put(100, equation);
        _myBox.put(200, buttonText);
        expression = equation;
        _myBox.put(id, id - 99);
        id++;

        if (buttonText == "Groceries") {
          iconImg = const Icon(Icons.local_grocery_store_rounded, color: iconWhite, size: 45);
          try {
          Parser p = Parser();
          Expression exp = p.parse(groceriesTotal);
          Expression exp2 = p.parse(equation);

          ContextModel cm = ContextModel();
          groceriesTotal = '${(exp + exp2).evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
        }
        if (buttonText == "Take-Out") {
          iconImg = const Icon(Icons.local_dining_rounded, color: iconWhite, size: 45);
          try {
          Parser p = Parser();
          Expression exp = p.parse(takeoutTotal);
          Expression exp2 = p.parse(equation);

          ContextModel cm = ContextModel();
          takeoutTotal = '${(exp + exp2).evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
        }
        if (buttonText == "Clothes") {
          iconImg = const Icon(Icons.local_mall_rounded, color: iconWhite, size: 45);
          try {
          Parser p = Parser();
          Expression exp = p.parse(clothesTotal);
          Expression exp2 = p.parse(equation);

          ContextModel cm = ContextModel();
          clothesTotal = '${(exp + exp2).evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
        }
        if (buttonText == "Relaxation") {
          iconImg = const Icon(Icons.spa_rounded, color: iconWhite, size: 45);
          try {
          Parser p = Parser();
          Expression exp = p.parse(relaxationTotal);
          Expression exp2 = p.parse(equation);

          ContextModel cm = ContextModel();
          relaxationTotal = '${(exp + exp2).evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
        }
        if (buttonText == "Gas") {
          iconImg = const Icon(Icons.local_gas_station_rounded, color: iconWhite, size: 45);
          try {
          Parser p = Parser();
          Expression exp = p.parse(gasTotal);
          Expression exp2 = p.parse(equation);

          ContextModel cm = ContextModel();
          gasTotal = '${(exp + exp2).evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
        }
        if (buttonText == "Phone") {
          iconImg = const Icon(Icons.phone_android_rounded, color: iconWhite, size: 45);
          try {
          Parser p = Parser();
          Expression exp = p.parse(phoneTotal);
          Expression exp2 = p.parse(equation);

          ContextModel cm = ContextModel();
          phoneTotal = '${(exp + exp2).evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
        }
        if (buttonText == "House") {
          iconImg = const Icon(Icons.holiday_village_rounded, color: iconWhite, size: 45);
          try {
          Parser p = Parser();
          Expression exp = p.parse(houseTotal);
          Expression exp2 = p.parse(equation);

          ContextModel cm = ContextModel();
          houseTotal = '${(exp + exp2).evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
        }
        if (buttonText == "Car") {
          iconImg = const Icon(Icons.local_car_wash_rounded, color: iconWhite, size: 45);
          try {
          Parser p = Parser();
          Expression exp = p.parse(carTotal);
          Expression exp2 = p.parse(equation);

          ContextModel cm = ContextModel();
          carTotal = '${(exp + exp2).evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
        }
        save(buttonText, equation, iconImg, _colorID);
        equation = "0";
      try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          Expression exp2 = p.parse(result);

          ContextModel cm = ContextModel();
          result = '${(exp + exp2).evaluate(EvaluationType.REAL, cm)}';
          _myBox.put(1, result);
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
}

  void save(String buttonText, String equation, Icon iconImg, int _colorID) {
    ExpenseItem newExpense = ExpenseItem(category: buttonText, amount: equation, img: iconImg, colorID: _colorID);
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 240,
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: bgLightGrey,
                ),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text('\$',
                      style: TextStyle(
                        color: equation == '0' ? bgDarkGrey : homeRed, fontSize: 40
                        ),
                      ),
                      Text(equation,
                      style: const TextStyle(
                        color: iconWhite, fontSize: 40
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 60,
                height: 60,
              ),
              calcButton('1', bgLightGrey, () => buttonPressed('1')),
              calcButton('2', bgLightGrey, () => buttonPressed('2')),
              calcButton('3', bgLightGrey, () => buttonPressed('3')),
              const SizedBox(
                width: 60,
                height: 60,
              ),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: () => 
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()),
                  ), 
                  style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
                  backgroundColor: homeRed),
                    child: const Text('\$',
                      style: TextStyle(fontSize: 27, color: Colors.white),
        ),
      ), 
    ),
              calcButton('4', bgLightGrey, () => buttonPressed('4')),
              calcButton('5', bgLightGrey, () => buttonPressed('5')),
              calcButton('6', bgLightGrey, () => buttonPressed('6')),
              Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: () => 
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home2()),
                  ), 
                  style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
                  backgroundColor: homeGreen),
                    child: const Text('\$',
                      style: TextStyle(fontSize: 27, color: Colors.white),
        ),
      ), 
    ),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 60,
                height: 60,
              ),
              calcButton('7', bgLightGrey, () => buttonPressed('7')),
              calcButton('8', bgLightGrey, () => buttonPressed('8')),
              calcButton('9', bgLightGrey, () => buttonPressed('9')),
              const SizedBox(
                width: 60,
                height: 60,
              ),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 60,
                height: 60,
              ),
              calcButton('.', bgLightGrey, () => buttonPressed('.')),
              calcButton('0', bgLightGrey, () => buttonPressed('0')),
              calcButton2(bgLightGrey, () => buttonPressed('<')),
              const SizedBox(
                width: 60,
                height: 60,
              ),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              catButton('Groceries', const Icon(Icons.local_grocery_store_rounded), bgLightGrey, () => buttonPressed('Groceries')),
              catButton('Take-Out', const Icon(Icons.local_dining_rounded), bgLightGrey, () => buttonPressed('Take-Out')),
              catButton('Clothes', const Icon(Icons.local_mall_rounded), bgLightGrey, () => buttonPressed('Clothes')),
              catButton('Relax', const Icon(Icons.spa_rounded), bgLightGrey, () => buttonPressed('Relaxation')),
            ],
          ),
          const SizedBox(
            height: 15,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              catButton('Gas', const Icon(Icons.local_gas_station_rounded), bgLightGrey, () => buttonPressed('Gas')),
              catButton('Phone', const Icon(Icons.phone_android_rounded), bgLightGrey, () => buttonPressed('Phone')),
              catButton('House', const Icon(Icons.holiday_village_rounded), bgLightGrey, () => buttonPressed('House')),
              catButton('Car', const Icon(Icons.local_car_wash_rounded), bgLightGrey, () => buttonPressed('Car')),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('EXPENSE MODE',
              style: TextStyle(
                color: homeRed, fontSize: 20
              ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const gNavContainer(),
    );
  }
}

///////////////////////////////////////////////////////////////////////

class gNavContainer extends StatelessWidget {
  const gNavContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgLightGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 7.5,
        ),
        child: navBar(context),
      ),
    );
  }
}
 