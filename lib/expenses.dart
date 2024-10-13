import 'package:flutter/material.dart';

class Expensed extends StatefulWidget {
  const Expensed({super.key});

  @override
  State<Expensed> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expensed> {
  @override
  Widget build(BuildContext context) {
    return const Text('Expenses');
  }
}
