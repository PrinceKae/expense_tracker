import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';


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

    Expense(
      title: 'Party',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),

  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
        //foregroundColor: Colors.black54,
        //backgroundColor: Colors.cyanAccent,
      ),
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
