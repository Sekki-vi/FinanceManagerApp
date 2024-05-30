import 'package:flutter/material.dart';
import '../colors.dart';

Widget budgetCard(Icon tileIcon, String tileText, String budgetTotal) {
  
  return Container(
    width: 350,
    height: 80,
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: bgLightGrey,
      borderRadius: BorderRadius.circular(10)
      ),
    child: Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: bgLightGrey,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          child: tileIcon,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(tileText, 
                  style: TextStyle(
                    color: iconWhite,
                    fontSize: 25),
                    ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 135,
                    child: Text('Total: $budgetTotal',
                    style: TextStyle(
                      color: iconWhite,
                      fontSize: 20,
                    ),
                    ),
                  ),
                  Container(
                    width: 165,
                    child: Text('Budget: \$5000',
                    style: TextStyle(
                      color: iconWhite,
                      fontSize: 20,
                    ),),
                  )
                ],
                ),
            ],
          ),
        ),
      ],
    ),
  );
}

