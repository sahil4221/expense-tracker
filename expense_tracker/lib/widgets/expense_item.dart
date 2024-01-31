import 'package:expense_tracker/models/expesne.dart';
import 'package:flutter/material.dart';


class ExpenseItem extends StatelessWidget{
  // check if something went wrong
  const ExpenseItem(this.expense,{super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return  Card(
      
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(children: [
          Text(expense.title),
          const SizedBox(
            height: 4,
          ),
          Row(children: [
            Text('Rs ${expense.amount.toStringAsFixed(0)}'),
            const Spacer(),
            Row(children: [
              Icon(CategoryIcons[expense.category]),
              const SizedBox(width: 5,),
              Text(expense.formattedDate),
            ],)
          ],)
        ]),
      ),);
  }
  
}