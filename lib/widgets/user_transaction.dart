// import 'package:flutter/material.dart';

// import './new_transaction.dart';
// import './transaction_list.dart';
// import '../models/transaction.dart';
// import './chart.dart';

// class UserTransaction extends StatefulWidget {
//   const UserTransaction({super.key});

//   @override
//   State<UserTransaction> createState() => _UserTransactionState();
// }

// class _UserTransactionState extends State<UserTransaction> {
//   final List<Transaction> _userTransactions = [
//     // Transaction(
//     //   id: 't1',
//     //   title: 'New Shoe',
//     //   amount: 69.99,
//     //   date: DateTime.now(),
//     // ),
//     // Transaction(
//     //   id: 't2',
//     //   title: 'Weekly Groceries',
//     //   amount: 16.99,
//     //   date: DateTime.now(),
//     // ),
//   ];

//   List<Transaction> get _recentTransaction {
//     return _userTransactions
//         .where((tx) =>
//             tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7))))
//         .toList();
//   }

//   void _addNewTransaction(String title, double amount) {
//     final newTx = Transaction(
//       id: DateTime.now().toString(),
//       title: title,
//       amount: amount,
//       date: DateTime.now(),
//     );
//     setState(() {
//       _userTransactions.add(newTx);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         NewTransaction(_addNewTransaction),
//         Chart(_recentTransaction),
//       ],
//     );
//   }
// }
