import 'package:flutter/material.dart';
import 'package:quiz_app/expense_item.dart';
import 'package:quiz_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoved});

  final void Function(Expense expense) onRemoved;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        child: ExpenseItem(expense: expenses[index]),
        onDismissed: (direction) {
          onRemoved(expenses[index]);
        },
      ),
    );
  }
}
