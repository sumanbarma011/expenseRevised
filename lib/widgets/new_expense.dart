import 'package:expense_revised/models/expense_model.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addNewExpense});
  final void Function(ExpenseModal) addNewExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category category = Category.food;
  ExpenseModal? newExpenseRecord;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;
  void showdate() async {
    DateTime date = DateTime.now();

    DateTime firstdate = DateTime(date.year - 1, date.month, date.day);

    final dateTimePicked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: firstdate,
        lastDate: date);
    setState(() {
      _selectedDate = dateTimePicked;
    });
  }

  void _submitExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    final enterdValueIsInvalid = (enteredAmount == null || enteredAmount <= 0);
    if (_titleController.text.isEmpty ||
        enterdValueIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please make sure that the valid input is entered'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Okay'))
                ],
              ));
      return;
    } else {
      newExpenseRecord = ExpenseModal(
          amount: enteredAmount,
          dateTime: _selectedDate!,
          title: _titleController.text,
          category: category);
      widget.addNewExpense(newExpenseRecord!);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '\$', label: Text('Amount')),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'No date selected '
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: showdate,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                  value: category,
                  items: (Category.values)
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.name)))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      category = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: _submitExpense, child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}
