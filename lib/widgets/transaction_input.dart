import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTx;
  TransactionInput(this.addNewTx);

  void submitTx() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }

    addNewTx(
      titleController.text,
      double.parse(amountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              // TODO fix
              onSubmitted: (_) => submitTx,
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              // TODO fix
              onSubmitted: (_) => submitTx,

              // onChanged: (value) => amountInput = value,
            ),
            TextButton(
              onPressed: () {
                submitTx();
                print(titleController.text);
                print(amountController.text);
                // print("title: $titleInput");
                // print("amount: $amountInput");
              },
              child: Text(
                "Add Transaction",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueAccent),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green.shade300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
