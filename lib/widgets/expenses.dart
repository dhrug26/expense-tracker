import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widgets/chart/chart.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> registeredExpenses = [];

  void _addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Deleted Successfully"),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  void openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        showDragHandle: true,
        backgroundColor: const Color.fromARGB(255, 159, 204, 255),
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
        backgroundColor: const Color.fromARGB(218, 14, 107, 206),
        title: const Text("Expense Tracker"),
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: registeredExpenses),
                Expanded(
                  child: ExpensesList(
                    onRemoveExpense: _removeExpense,
                    expList: registeredExpenses,
                  ),
                )
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: registeredExpenses)),
                Expanded(
                  child: ExpensesList(
                    onRemoveExpense: _removeExpense,
                    expList: registeredExpenses,
                  ),
                )
              ],
            ),
    );
  }
}
