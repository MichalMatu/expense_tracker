import 'dart:math';

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expensed extends StatefulWidget {
  const Expensed({super.key});

  @override
  State<Expensed> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expensed> {
  final List<Expense> _registredExpenses = [];

  void _openExpenseOverlay() {
    // Add a method to open the expense overlay
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              addExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    // Add a method to add a new expense
    setState(() {
      _registredExpenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final expenseIndex = _registredExpenses.indexOf(expense);
    // Add a method to delete an expense
    setState(() {
      _registredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _registredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('No expenses found'));

    if (_registredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registredExpenses, deleteExpense: _deleteExpense);
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Add an icon button to the app bar, on the laft side
          IconButton(
              onPressed: _openExpenseOverlay,
              icon: const Icon(Icons.add, color: Colors.black, size: 50)),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registredExpenses),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
