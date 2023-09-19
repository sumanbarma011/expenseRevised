import 'package:expense_revised/models/expense_model.dart';
import 'package:expense_revised/widgets/chart/chart.dart';
import 'package:expense_revised/widgets/chart/chart_bar.dart';
import 'package:expense_revised/widgets/expense_list.dart';
import 'package:expense_revised/widgets/new_expense.dart';
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

  void _addNewExpense(ExpenseModal newExpense) {
    setState(() {
      _registeredExpense.add(newExpense);
    });
  }

  void _removeExpense(ExpenseModal expense) {
    int expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense details removed'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  void getAddActionBottom() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              addNewExpense: _addNewExpense,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(onPressed: getAddActionBottom, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpense),
          Expanded(
            child: ExpenseList(
                expenseList: _registeredExpense,
                onRemoveExpense: _removeExpense),
          ),
        ],
      ),
    );
  }
}
