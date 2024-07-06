import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/expenses.dart';
import 'package:quiz_app/expenses_list.dart';
import 'package:quiz_app/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  Category _selectedCategory = Category.leisure;

  void percentDatePicker() async {
    //show datepicker
    final now = DateTime.now();
    final startDate = DateTime(now.year - 1, now.month, now.day);
    final endDate = DateTime(now.year + 99, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: startDate, lastDate: endDate);
    print(pickedDate);
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void submitForm() {
    final enteredAmount = double.tryParse(_amountController.text);
    if (_titleController.text.trim().isEmpty ||
        enteredAmount == null ||
        enteredAmount.isNegative ||
        selectedDate == null) {
      if (Platform.isIOS) {
        showCupertinoDialog(
            context: context,
            builder: (ctx) => CupertinoAlertDialog(
                  title: const Text('Invalid input'),
                  content: const Text('Please check inputs'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'))
                  ],
                ));
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Invalid input'),
            content: const Text('Please check inputs'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          ),
        );
      }
      return;
    }
    //add to list of expenses
    final newExpense = Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: selectedDate!,
        category: _selectedCategory);
    widget.onAddExpense(newExpense);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardH = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final contW = constraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardH + 16),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Name'),
                  ),
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  controller: _titleController,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                          decoration: const InputDecoration(
                            label: Text('Amount'),
                            prefix: Text('\$'),
                          ),
                          maxLength: 20,
                          keyboardType: TextInputType.number,
                          controller: _amountController),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(selectedDate == null
                              ? 'Selected date'
                              : formatter.format(selectedDate!)),
                          IconButton(
                              onPressed: percentDatePicker,
                              icon: const Icon(Icons.calendar_month)),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          print(value);
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        }),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: submitForm,
                      child: const Text('Save Expense'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
