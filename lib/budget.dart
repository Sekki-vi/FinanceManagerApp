import 'package:flutter/material.dart';
import '../budgetcard.dart';
import '../navbar.dart';
import '../colors.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}


class _BudgetState extends State<Budget> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkGrey,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: bgLightGrey,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Set Budgets',
                    style: TextStyle(
                      fontSize: 30,
                      color: iconWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
                width: 380,
                height: 600,
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: bgDarkGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListView(
                  children: [
                    budgetCard(Icon(Icons.local_grocery_store_rounded, color: iconWhite, size: 50), "Groceries", groceriesTotal),
                    budgetCard(Icon(Icons.local_dining_rounded, color: iconWhite, size: 50), "Take-Out", takeoutTotal),
                    budgetCard(Icon(Icons.local_mall_rounded, color: iconWhite, size: 50), "Clothes", clothesTotal),
                    budgetCard(Icon(Icons.spa_rounded, color: iconWhite, size: 50), "Relaxation", relaxationTotal),
                    budgetCard(Icon(Icons.local_gas_station_rounded, color: iconWhite, size: 50), "Gas", gasTotal),
                    budgetCard(Icon(Icons.phone_android_rounded, color: iconWhite, size: 50), "Phone", phoneTotal),
                    budgetCard(Icon(Icons.holiday_village_rounded, color: iconWhite, size: 50), "House", houseTotal),
                    budgetCard(Icon(Icons.local_car_wash_rounded, color: iconWhite, size: 50), "Card", carTotal),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: gNavContainer(),
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

