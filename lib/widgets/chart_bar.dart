import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctofTotal;
  const ChartBar({
    super.key,
    required this.label,
    required this.spendingAmount,
    required this.spendingPctofTotal,
  });

  @override
  Widget build(BuildContext context) {
    print('build() ChartBar');
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            SizedBox(
                height: constraints.maxHeight * 0.15,
                child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
            const SizedBox(height: 4),
            SizedBox(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: const Color.fromRGBO(220, 220, 220, 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctofTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.1,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
