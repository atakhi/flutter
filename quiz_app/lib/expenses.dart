import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/chart.dart';
import 'package:quiz_app/expenses_list.dart';
import 'package:quiz_app/models/expense.dart';
import 'package:quiz_app/new_expense.dart';

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

  _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            onAddExpense: (Expense expense) {
              _addExpense(expense);
            },
          );
        });
  }

  _addExpense(Expense exp, {int? index}) {
    if (index == null) {
      setState(() {
        _registeredExpenses.add(exp);
      });
    } else {
      setState(() {
        _registeredExpenses.insert(index, exp);
      });
    }
  }

  _onRemoved(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Removed"),
        duration: const Duration(milliseconds: 3000),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              _addExpense(expense, index: expenseIndex);
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No expenses, please add"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoved: _onRemoved,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter expense tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
