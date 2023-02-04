import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UPIButtons {
  static Map<String, IconData> buttons = {
    "Scan & Pay": CupertinoIcons.qrcode_viewfinder,
    "To Mobile or Contact": Icons.contacts,
    "To Bank or Self Account": Icons.account_balance,
    "Balance & History": Icons.receipt_long,
    "Wallet": Icons.wallet,
    "Cashback & Offers": Icons.local_offer_sharp,
    "Credit Card": CupertinoIcons.creditcard_fill,
    "More Services": CupertinoIcons.square_stack_3d_up_fill,
  };
}
