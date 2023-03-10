import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  const NewTransaction(
    this.addTx, {
    super.key,
  });

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final title = _titleController.text;
    final amount = double.parse(
      _amountController.text == '' ? '0' : _amountController.text,
    );
    if (_amountController.text.isEmpty) {
      return;
    }

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build() NewTransaction');
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            right: 10,
            left: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) => titleInput = val,
              ),
              TextField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) => amountInput = val,
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                      ),
                    ),
                    AdaptiveFlatButton('Choose Date', _presentDatePicker),
                  ],
                ),
              ),
              TextButton(
                onPressed: _submitData,
                style: TextButton.styleFrom(
                  foregroundColor:
                      Theme.of(context).buttonTheme.colorScheme!.background,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text('Add Transcation'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
