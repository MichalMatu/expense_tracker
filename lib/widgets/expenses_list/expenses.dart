import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expensed extends StatefulWidget {
  const Expensed({super.key});

  @override
  State<Expensed> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expensed> {
  final List<Expense> _registredExpenses = [
    Expense(
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Weekly Groceries',
      amount: 99.99,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

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

  @override
  Widget build(BuildContext context) {
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
          const Text('The chart will go here!'),
          Expanded(
            child: ExpensesList(expenses: _registredExpenses),
          )
        ],
      ),
    );
  }
}
