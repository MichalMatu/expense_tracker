import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Add an icon button to the app bar, on the laft side
          IconButton(
              onPressed: () {},
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
