import 'package:flutter/material.dart';



class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        TextField(
       controller: _titleController,
        maxLength: 50,
        decoration:const  InputDecoration(
          label: Text('Title'),
        ),
      ),
        Expanded(
          child: Row(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: const InputDecoration(
                  prefixText: '\$ ',
                  label: Text('Amount'),
                  ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Select Date'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ))
            ],
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
               print(_titleController.text);
              },
              child: const Text('Save Expense'),
            ),
          ],
        ),


    ]
    ),

    );
  }
}
