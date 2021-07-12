import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bars.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTxs;
  Chart(this.recentTxs);

  List get groupedTxValues {
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

      //print("date seysi: " + DateFormat.E().format(day));
      //print("totalsum: " + totalSum.toString());
      return {"day": DateFormat.E().format(day), "amount": totalSum};
    });
  }

  double get totalSpending {
    return groupedTxValues.fold(0, (prev, elem) => prev + elem["amount"]);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTxValues.map((data) {
          return ChartBar(data["day"], data["amount"],
              totalSpending == 0.0 ? 0.0 : data["amount"] / totalSpending);
        }).toList(),
      ),
    );
  }
}
