import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter=DateFormat.yMd();
enum Category { food, work, leisure, travel }

const categoryIcons = {
  Category.food: Icons.dining,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff
};

class ExpenseModal {
  ExpenseModal(
      {required this.amount,
      required this.dateTime,
      required this.title,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;
 
 String get formattedDate {
  return formatter.format(dateTime);


 }

}
