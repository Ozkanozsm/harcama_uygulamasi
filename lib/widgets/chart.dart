import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTxs;
  Chart(this.recentTxs);

  List<Map<String, Object>> get groupedTxValues {
    return List.generate(7, (index) {
      final day = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTxs.length; i++) {
        if (recentTxs[i].date.day == day.day &&
            recentTxs[i].date.month == day.month &&
            recentTxs[i].date.year == day.year) {
          totalSum += recentTxs[i].amount;
        }
      }

      print("date seysi: " + DateFormat.E().format(day));
      print("totalsum: " + totalSum.toString());
      return {"day": DateFormat.E().format(day), "amount": totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        children: groupedTxValues.map((data) {
          return Text('${data["day"]}: ${data["amount"].toString()}');
        }).toList(),
      ),
    );
  }
}
