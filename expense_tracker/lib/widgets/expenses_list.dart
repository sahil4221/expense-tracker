import 'package:expense_tracker/models/expesne.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});
  
  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            onDismissed: (direction){
              onRemoveExpense(expenses[index]);
            } ,
            key: ValueKey(
              expenses[index]), 
            child: ExpenseItem(
              expenses[index] 
            )
        )
      );
  }
}

