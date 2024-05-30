import 'package:flutter/material.dart';
import '../navbar.dart';
import '../colors.dart';
import '../transaction_data.dart';
import 'package:provider/provider.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key,});

  @override
  State<Transactions> createState() => _TransactionsState();

}

class _TransactionsState extends State<Transactions>{
  int id = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkGrey,
      body: Column(
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 60,
                color: homeRed,
                child: Center(
                  child: Text(result,
                    style: const TextStyle(color: iconWhite, fontSize: 30),
                    ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 60,
                color: homeGreen,
                child: Center(
                  child: Text(result2,
                    style: const TextStyle(color: iconWhite, fontSize: 30),
                    ),
                ),
              ),
            ],
          ),
              Consumer<ExpenseData>(
                builder:(context, value, child) => Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  width: 400,
                  height: 624,
                  child: ListView.builder(
                    itemCount: value.getAllExpenseList().length,
                    itemBuilder: (context, index) =>
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(bottom:25),
                        
                        decoration: BoxDecoration(
                          color: bgLightGrey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 30,
                              height: double.infinity,
                            ),
                            value.getAllExpenseList()[index].img,        
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              width: 190,
                              child: Text(value.getAllExpenseList()[index].category,
                              style: const TextStyle(
                                fontSize: 30,
                                color: iconWhite,
                              ),),
                            ),
                            Text(value.getAllExpenseList()[index].amount,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: value.getAllExpenseList()[index].colorID == 1 ? homeRed : homeGreen,
                              fontSize: 30,
                              
                              ),
                            ),
                            ],
                        ),
                      ),
                    ),
                  ),
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
