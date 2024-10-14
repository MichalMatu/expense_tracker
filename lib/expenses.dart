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
      amount: 103.45,
      // set date to yesterday
      date: DateTime.now().subtract(const Duration(days: 1)),
      category: Category.food,
    ),
    Expense(
      title: 'New Phone',
      amount: 799.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New Desk',
      amount: 199.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New Monitor',
      amount: 299.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New Keyboard',
      amount: 99.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New Mouse',
      amount: 49.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New Chair',
      amount: 199.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New Lamp',
      amount: 29.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New Plant',
      amount: 9.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('The chart will go here!'),
          Text('The list of transactions will go here!')
        ],
      ),
    );
  }
}
