import 'package:expense_revised/models/expense_model.dart';
import 'package:expense_revised/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenseList, required this.onRemoveExpense});
  final List<ExpenseModal> expenseList;
  final void Function(ExpenseModal expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          height: 30,
        ),
        key: ValueKey(expenseList[index]),
        onDismissed: (direction) => onRemoveExpense(expenseList[index]),
        child: ExpenseItem(expenseItem: expenseList[index]),
      ),
    );
  }
}
