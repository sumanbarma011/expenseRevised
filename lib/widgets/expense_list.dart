import 'package:expense_revised/models/expense_model.dart';
import 'package:expense_revised/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenseList});
  final List<ExpenseModal> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (ctx, index) =>
            ExpenseItem(expenseItem: expenseList[index]));
  }
}
