import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text("Transactions are empty!"),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "assets/images/flutter_logo.png",
                  fit: BoxFit.cover,
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 3,
                  ),
                  elevation: 5,
                  child: ListTile(
                      leading: CircleAvatar(
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              transactions[index].amount.toStringAsFixed(2),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        DateFormat('E, dd-MM-yy')
                            .format(transactions[index].date),
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark),
                      ),
                      trailing: IconButton(
                        onPressed: () => deleteTx(transactions[index].id),
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      )),
                );
              },
            ),
    );
  }
}
