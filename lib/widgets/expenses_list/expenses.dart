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
    // Add a method to delete an expense
    setState(() {
      _registredExpenses.remove(expense);
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
            child: ExpensesList(
                expenses: _registredExpenses, deleteExpense: _deleteExpense),
          )
        ],
      ),
    );
  }
}
