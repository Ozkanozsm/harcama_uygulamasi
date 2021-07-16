import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spAmount;
  final double pctofTotal;

  ChartBar(this.label, this.spAmount, this.pctofTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text("\$${spAmount.toStringAsFixed(0)}"),
          ),
        ),
        SizedBox(
          height: 1.5,
        ),
        Container(
          height: 100,
          width: 45,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.5,
                  ),
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: pctofTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          "$label",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
