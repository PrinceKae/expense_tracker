import 'package:uuid/uuid.dart';

import 'package:expense_tracker/widgets/expenses.dart';

const uuid = Uuid();

enum Category {work, food, leisure, travel, bills,}

class Expense{
  Expense({
   required this.date,
   required this.title,
   required this.amount,
  required this.category
  }
      ) : id = uuid.v4();


  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}