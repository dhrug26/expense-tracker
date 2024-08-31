import 'package:expense_tracker_app/model/expense.dart';
// import 'package:expense_tracker_app/widgets/expenses.dart';
// import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final fomatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Expense? expenseToBeAdded;
  Category? selectedCategory;
  String? categoryName;
  DateTime? _selectedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsValid = (enteredAmount == null || enteredAmount <= 0);
    if (amountIsValid ||
        _titleController.text.trim().isEmpty ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Invalid Data"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("OK bsdk"))
          ],
        ),
      );
    } else {
      final enteredAmount = double.tryParse(_amountController.text);
      ////
      expenseToBeAdded = Expense(
          category: selectedCategory!,
          title: _titleController.text.trim(),
          amount: enteredAmount!,
          date: _selectedDate!);
      widget.onAddExpense(expenseToBeAdded!);
      expenseToBeAdded = null;
      /////
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("MOJ KRDI"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  Navigator.pop(ctx);
                },
                child: Text("mehngai badd gyi h"))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration:
                  const InputDecoration(label: Text("Enter your Title")),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLength: 10,
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Enter Amount"),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? formatter.format(DateTime.now())
                            : formatter.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                DropdownButton(
                  value: selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toString()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(
                      () {
                        selectedCategory = value;
                      },
                    );
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: submitExpenseData,
                  child: const Text("Save"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'))
              ],
              //   //   ),
              //   // ),
              //
            )
          ],
        ),
      ),
    );
  }
}


 //   Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       TextField(
          //         maxLength: 10,
          //         controller: _amountController,
          //         keyboardType: TextInputType.number,
          //         decoration: const InputDecoration(
          //           label: Text("Enter Amount"),
          //         ),
          //       ),
          //       // const SizedBox(width: 8),
          //       // // Expanded(
          //       // //   child:
          //       // //
          //       // IconButton(
          //       //     onPressed: () {}, icon: const Icon(Icons.calendar_month)),
          //     ],
          //   ),
          // Expanded(
          //   child: