import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transation_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  const TransactionList(this.transactions, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    print('build() TransacrionList');
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transaction added yet!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.fill,
                  ),
                )
              ],
            );
          })
        : ListView(
            children: transactions
                .map(
                  (tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transactions: tx,
                    deleteTx: deleteTx,
                  ),
                )
                .toList(),
          );
    ListView.builder(
      itemBuilder: (ctx, index) {
        final tx = transactions[index];
        return TransactionItem(transactions: tx, deleteTx: deleteTx);
      },
      itemCount: transactions.length,
    );
  }
}
