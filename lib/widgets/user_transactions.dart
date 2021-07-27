import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './chart.dart';
import './transaction_input.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [];
  // final List<Transaction> _transactions = [
  //   Transaction(
  //     id: "t01",
  //     title: "Shoes",
  //     amount: 85,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: "t02",
  //     title: "Tickets",
  //     amount: 29.99,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: "t03",
  //     title: "Groceries",
  //     amount: 40.5,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: "t04",
  //     title: "Bills",
  //     amount: 95.0,
  //     date: DateTime.now(),
  //   ),
  // ];

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );

    setState(() {
      _transactions.add(newTx);
      print("Added new tx");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Chart(_transactions),
      TransactionInput(_addNewTransaction),
      SingleChildScrollView(child: TransactionList(_transactions)),
    ]);
  }
}
