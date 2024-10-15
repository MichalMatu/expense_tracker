import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
// import intl for date formatting
import 'package:intl/intl.dart';

class ExpenseItems extends StatelessWidget {
  const ExpenseItems(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Adds a shadow effect
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Adds padding inside the card
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns text to the left
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8), // Adds spacing between title and amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}', // Displays the amount with 2 decimal places
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green[700],
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time, // Clock icon
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                        width:
                            4), // Adds a little space between the icon and the text
                    Text(
                      DateFormat('yyyy-MM-dd HH:mm').format(expense.date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
