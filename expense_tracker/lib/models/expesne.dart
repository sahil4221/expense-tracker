import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category{food , travel , leisure , work}


const uuid = Uuid();


// ignore: constant_identifier_names
const CategoryIcons = {
  Category.food : Icons.lunch_dining,
  Category.travel : Icons.flight_takeoff,
  Category.leisure : Icons.movie, 
  Category.work : Icons.work

};

final formatter = DateFormat().add_yMd();

class Expense{
Expense({required this.category,  required this.title, required this.amount, required this.date}) : id= uuid.v4();

  // ignore: empty_constructor_bodies
  final String id;//1,2,3,
  final String title; 
  final double amount;
  final DateTime date;
  final Category category;


  String get formattedDate {
    return formatter.format(date);
  }



}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)

  :expenses = allExpenses.where((expense) => expense.category == category).toList();

  double get totalExpenses{
    double sum = 0;
    for(final expense in expenses){
      sum = sum+ expense.amount;
    } 
    return sum;
  }

}



