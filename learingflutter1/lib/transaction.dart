import 'package:flutter/material.dart';

class Transaction {
  String content;
  double amount;
  Transaction({this.content = '', this.amount = 0.0});
  @override
  String toString() {
    // TODO: implement toString
    return 'content: {$content} , amount: {$amount}';
  }
}
