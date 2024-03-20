import 'package:flutter/material.dart';
import 'package:quiz_app/expenses_list.dart';
import 'package:quiz_app/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 19.99999,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Travel',
        amount: 29.99,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Cinema',
        amount: 11.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Burger',
        amount: 9.99,
        date: DateTime.now(),
        category: Category.food)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
