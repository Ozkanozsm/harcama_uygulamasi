import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTx;
  TransactionInput(this.addNewTx);

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
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              // onChanged: (value) => amountInput = value,
            ),
            TextButton(
              onPressed: () {
                addNewTx(
                    titleController.text, double.parse(amountController.text));
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
