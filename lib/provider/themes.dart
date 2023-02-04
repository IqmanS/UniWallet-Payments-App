import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SelectTheme { origTheme, lowBalanceTheme, highBalanceTheme }

class CustomThemes {
  static ThemeData origTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontFamily: "Metropolis",
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      headline2: TextStyle(
        fontFamily: "Metropolis",
        fontSize: 22,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white, size: 28),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xfffbaf03),
      onPrimary: const Color(0xfffbaf03),
      secondary: const Color(0xfffbaf03),
      onSecondary: const Color(0xfffbaf03),
      error: const Color(0xffff5f03),
      onError: const Color(0xffff5f03),
      background: Colors.black,
      onBackground: Colors.black,
      surface: Colors.blueGrey.shade100,
      onSurface: Colors.blueGrey.shade100,
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xfffbaf03),
      elevation: 0,
    ),
    primaryColor: const Color(0xfffbaf03),
  );
  static ThemeData lowBalanceTheme = origTheme.copyWith(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.red,
      onPrimary: Colors.red,
      secondary: Colors.red,
      onSecondary: Colors.red,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.black,
      onBackground: Colors.black,
      surface: Colors.blueGrey.shade100,
      onSurface: Colors.blueGrey.shade100,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.red,
    ),
    primaryColor: Colors.red,
  );
  static ThemeData highBalanceTheme = origTheme.copyWith(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.green,
      onPrimary: Colors.green,
      secondary: Colors.green,
      onSecondary: Colors.green,
      error: Colors.green,
      onError: Colors.green,
      background: Colors.black,
      onBackground: Colors.black,
      surface: Colors.blueGrey.shade100,
      onSurface: Colors.blueGrey.shade100,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.green,
    ),
    primaryColor: Colors.green,
  );
}

class ThemeProvider with ChangeNotifier {
  ThemeData currentTheme = CustomThemes.origTheme;
  // double balance;
  // ThemeProvider(this.balance);

  // void setTheme() {
  //   if (balance == 0) {
  //     currentTheme = CustomThemes.origTheme;
  //   } else if (balance > 5000) {
  //     currentTheme = CustomThemes.highBalanceTheme;
  //   } else if (balance < 2000) {
  //     currentTheme = CustomThemes.lowBalanceTheme;
  //   }
  //   notifyListeners();
  // }

  void changeTheme(SelectTheme theme) {
    if (theme == SelectTheme.lowBalanceTheme) {
      currentTheme = CustomThemes.lowBalanceTheme;
    } else if (theme == SelectTheme.highBalanceTheme) {
      currentTheme = CustomThemes.highBalanceTheme;
    } else {
      currentTheme = CustomThemes.origTheme;
    }
    notifyListeners();
  }
}
