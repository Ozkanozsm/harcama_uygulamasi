import 'package:flutter/material.dart';

import './transaction.dart';
import './TransactionsColumn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t01",
      title: "Shoes",
      amount: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t02",
      title: "Tickets",
      amount: 29.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.purpleAccent,
              child: Text("BURALAR DUTLUK"),
            ),
            Column(
              children: [
                Card(
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: "TextField1"),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "TextField2"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Add Transaction",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueAccent),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green.shade300),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TransactionsColumn(transactions),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
