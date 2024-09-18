import 'package:flutter/material.dart';

class TransactionCondition extends StatelessWidget {
  final String type;
  final int amount;
  final Image icon;
  String text;

  TransactionCondition({
    super.key,
    required this.type,
    required this.amount,
    required this.icon,
    this.text = "INCOME",
  });

  @override
  Widget build(BuildContext context) {
    if (type == "expense") {
      text = "EXPENSE";
    } else if (type == "income") {
      text = "INCOME";
    } else if (type == "total") {
      text = "TOTAL";
    } else {
      text = "INVALID";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 18,
              width: 18,
              child: icon,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(text),
            ),
          ],
        ),
        Text('₹ $amount'),
      ],
    );
  }
}
