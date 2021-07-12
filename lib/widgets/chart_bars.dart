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
        Text("${spAmount.toStringAsFixed(0)}"),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 50,
          width: 50,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.amber,
                    width: 1,
                  ),
                  color: Color.fromRGBO(220, 200, 200, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: pctofTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
