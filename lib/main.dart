import 'package:flutter/material.dart';

import './transaction.dart';

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
              elevation: 10,
            ),
            Column(
              children: transactions
                  .map((tx) => Card(
                        child: Row(
                          children: [
                            Container(
                              child: ElevatedButton(
                                child: Icon(
                                  Icons.money,
                                ),
                                onPressed: null,
                              ),
                            ),
                            Column(
                              children: [
                                Text(tx.title),
                                Text("bruh"),
                                Text(tx.date.toString()),
                              ],
                            ),
                            Container(
                              child: Text(tx.amount.toString()),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
