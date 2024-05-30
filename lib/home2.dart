import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../calcbutton.dart';
import '../catbutton.dart';
import '../colors.dart';
import '../expense_item.dart';
import '../navbar.dart';
import '../calcbutton2.dart';
import '../home.dart';
import 'package:math_expressions/math_expressions.dart';
import '../transaction_data.dart';
import 'package:provider/provider.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _HomeState();
}

class _HomeState extends State<Home2> {

  final _myBox = Hive.box('mybox');
  
  String expression = "";
  int id = 100;
  final int _colorID = 2;

  buttonPressed(String buttonText) {

  setState(() {

      if (buttonText == "<") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }

      } else if (buttonText == "Salary" || buttonText == "Invest" || buttonText == "Taxes" || buttonText == "Wages" || buttonText == "Revenue") {
        _myBox.put(100, equation);
        _myBox.put(200, buttonText);
        expression = equation;
        _myBox.put(id, id - 99);
        id++;

        if (buttonText == "Salary") {
          iconImg = const Icon(Icons.wallet_rounded, color: iconWhite, size: 45);
        }
        if (buttonText == "Invest") {
          iconImg = const Icon(Icons.currency_bitcoin_rounded, color: iconWhite, size: 45);
        }
        if (buttonText == "Taxes") {
          iconImg = const Icon(Icons.monetization_on_rounded, color: iconWhite, size: 45);
        }
        if (buttonText == "Wages") {
          iconImg = const Icon(Icons.local_atm_rounded, color: iconWhite, size: 45);
        }
        if (buttonText == "Revenue") {
          iconImg = const Icon(Icons.account_balance_wallet_rounded, color: iconWhite, size: 45);
        }

        save(buttonText, equation, iconImg, _colorID);
        equation = "0";

      try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          Expression exp2 = p.parse(result2);

          ContextModel cm = ContextModel();
          result2 = '${(exp + exp2).evaluate(EvaluationType.REAL, cm)}';
          _myBox.put(2, result2);
        } catch (e) {
          result2 = "Error";
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
    ExpenseItem newIncome = ExpenseItem(category: buttonText, amount: equation, img: iconImg, colorID: _colorID);
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newIncome);
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
                        color: equation == '0' ? bgDarkGrey : homeGreen, fontSize: 40
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
                      style: const TextStyle(fontSize: 27, color: Colors.white),
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
                      style: const TextStyle(fontSize: 27, color: Colors.white),
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
              catButton('Salary', const Icon(Icons.wallet_rounded), bgLightGrey, () => buttonPressed('Salary')),
              catButton('Invest', const Icon(Icons.currency_bitcoin_rounded), bgLightGrey, () => buttonPressed('Invest')),
              catButton('Taxes', const Icon(Icons.monetization_on_rounded), bgLightGrey, () => buttonPressed('Taxes')),
              catButton('Wages', const Icon(Icons.local_atm_rounded), bgLightGrey, () => buttonPressed('Wages')),
            ],
          ),
          const SizedBox(
            height: 15,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              catButton('Revenue', const Icon(Icons.account_balance_wallet_rounded), bgLightGrey, () => buttonPressed('Revenue')),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('INCOME MODE',
              style: TextStyle(
                color: homeGreen, fontSize: 20
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

//class gNav extends StatelessWidget {
 