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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            expense.title, style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          )),
          const SizedBox(
            height: 4,
          ),
          Row(children: [
            Text('Rs ${expense.amount.toStringAsFixed(0)}', style: const TextStyle(fontSize: 13),),
            const Spacer(),
            Row(children: [
              Icon(CategoryIcons[expense.category]),
              const SizedBox(width: 5,),
              Text(expense.formattedDate,style: const TextStyle(fontSize: 13),),
            ],)
          ],)
        ]),
      ),);
  }
  
}