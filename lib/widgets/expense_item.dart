import 'package:expense_revised/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenseItem});
  final ExpenseModal expenseItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseItem.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('\$${expenseItem.amount}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenseItem.category]),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(expenseItem.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
