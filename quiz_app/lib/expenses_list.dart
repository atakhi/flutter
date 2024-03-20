import 'package:flutter/material.dart';
import 'package:quiz_app/expense_item.dart';
import 'package:quiz_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => ExpenseItem(expense: expenses[index]));
  }
}
