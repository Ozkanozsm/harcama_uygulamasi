import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction.dart';

class TransactionsColumn extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsColumn(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((tx) => Card(
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
                elevation: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child: Icon(
                          Icons.attach_money_outlined,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat('E, dd-MM-yy').format(tx.date),
                          style: TextStyle(
                              color: Colors.red,
                              backgroundColor: Colors.cyanAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                          width: 5,
                        ),
                      ),
                      child: Text(
                        // TODO fix
                        tx.amount.toString().padLeft(5, "0"),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}