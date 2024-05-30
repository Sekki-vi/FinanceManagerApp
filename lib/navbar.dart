import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../budget.dart';
import '../colors.dart';
import '../transactions.dart';
import '../home.dart';
import '../categories.dart';

int index = 0;
Color tabColor = homeGreen;

Widget navBar (BuildContext context) {
  return GNav(
    rippleColor: const Color.fromARGB(99, 255, 255, 255),
      duration: Duration(milliseconds: 1000),
      backgroundColor: bgLightGrey,
      color: iconWhite,
      activeColor: iconWhite,
      tabBackgroundColor: tabColor,
      padding: EdgeInsets.all(15),
      gap: 4,
      selectedIndex: index,
      tabs: [
        GButton(icon: Icons.home_rounded,
        text: 'Home',
        onPressed: () {
          Navigator.push(context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => Home()),
          );
          index = 0;
          tabColor = homeGreen;
        },
        ),
        GButton(icon: Icons.collections_bookmark_rounded,
        text: 'Transactions',
        onPressed: () {
  
          Navigator.push(context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => Transactions()),
          );
          index = 1;
          tabColor = homeBlue;
        },
        ),
        GButton(icon: Icons.category_rounded,
        text: 'Categories',
        onPressed: () {
          Navigator.push(context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => Categories()),
          );
          index = 2;
          tabColor = homeRed;
        },
        ),
        GButton(icon: Icons.monetization_on_rounded,
        text: 'Budget',
        onPressed: () {
          Navigator.push(context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => Budget()),
          );
          index = 3;
          tabColor = homeYellow;
        },
        ),
      ]
  );
}
