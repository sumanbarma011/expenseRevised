import 'package:expense_revised/models/expense_model.dart';
import 'package:expense_revised/widgets/expense_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModal> _registeredExpense = [
    ExpenseModal(
        amount: 2300,
        dateTime: DateTime.now(),
        title: 'Burger',
        category: Category.food),
    ExpenseModal(
        amount: 4500,
        dateTime: DateTime.now(),
        title: 'Jacket',
        category: Category.leisure),
    ExpenseModal(
        amount: 45000,
        dateTime: DateTime.now(),
        title: 'Canada',
        category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('bars'),
          Expanded(
            child:
             ExpenseList(expenseList: _registeredExpense),
          ),
        ],
      ),
    );
  }
}
