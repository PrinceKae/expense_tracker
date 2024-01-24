import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Light Bill',
      amount: 19.89,
      date: DateTime.now(),
      category: Category.bills,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column( children: [
      const  Text('The Chart'),
     Expanded(
       child:
         ExpenseList(expenses: _registeredExpenses),
     ),
      ],),
    );
  }
}
