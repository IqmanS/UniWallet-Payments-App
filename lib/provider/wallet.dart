import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wallet with ChangeNotifier {
  List<double> transactions = [
    5000,
    4500,
    4220,
    4200,
    3800,
    4200,
    4400,
    2400,
    3600,
    4800
  ];
  double currentBalance = 4800;

  List<double> get transaction {
    return [...transactions];
  }

  void deposit(double money) {
    currentBalance = currentBalance + money;
    transactions.add(currentBalance);
    notifyListeners();
  }

  void withdraw(double money) {
    currentBalance = currentBalance - money;
    transactions.add(currentBalance);
    notifyListeners();
  }
}
