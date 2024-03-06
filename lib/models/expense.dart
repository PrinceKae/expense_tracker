import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();



const uuid = Uuid();

enum Category {work, food, leisure, travel, bills,}

const categoryIcons = {
  Category.food: Icons.dining_outlined,
  Category.bills: Icons.payments_outlined,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,



};

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

  String get formattedDate {
    return formatter.format(date);
  }
}