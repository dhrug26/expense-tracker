//import 'package:expense_tracker_app/widgets/expenses.dart';

import 'package:expense_tracker_app/main.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expList, super.key, required this.onRemoveExpense});
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expList;
  @override
  Widget build(BuildContext context) {
    if (expList.isEmpty) {
      return const Center(
        child: Text("No data, try adding some"),
      );
    } else {
      return ListView.builder(
        itemCount: expList.length,
        itemBuilder: (ctx, index) => Dismissible(
            background: Container(
              color: kColorScheme.error,
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            ),
            onDismissed: (direction) {
              onRemoveExpense(expList[index]);
            },
            key: ValueKey(expList[index]),
            child: ExpenseItem(expList[index])),
      );
    }
  }
}
