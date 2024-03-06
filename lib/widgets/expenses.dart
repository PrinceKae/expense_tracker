import 'package:expense_tracker/widgets/expenses_list.dart';
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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense,),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void  _removeExpense (Expense expense){
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Deleted Expense'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
        child: Text('No expenses found. Add some now'),);

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpenseList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseOverlay,
        backgroundColor: Colors.black45,
        child: const Icon(Icons.add),

      ),
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        // actions: [
        //   IconButton(
        //     onPressed: _openAddExpenseOverlay,
        //     icon: const Icon(Icons.add),
        //   ),
        // ],
        //foregroundColor: Colors.black54,
        //backgroundColor: Colors.cyanAccent,
      ),
      body: Column( children: [
      const  Text('The Chart'),
     Expanded(
       child: mainContent
     ),
             ],),
    );
  }
}
