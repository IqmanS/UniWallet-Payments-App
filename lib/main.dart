import 'package:fampay_hack/provider/fin_lit.dart';
import 'package:fampay_hack/provider/themes.dart';
import 'package:fampay_hack/provider/wallet.dart';
import 'package:fampay_hack/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Wallet(),
        ),
        // ChangeNotifierProxyProvider<Wallet, ThemeProvider>(
        //   create: (context) => ThemeProvider(0),
        //   update: (context, value, previous) =>
        //       ThemeProvider(value.currentBalance),
        // ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FinLit(),
        )
      ],
      child: Consumer<ThemeProvider>(builder: (context, theme, _) {
        double bal = Provider.of<Wallet>(context).currentBalance;
        return MaterialApp(
          title: 'Flutter Demo',
          theme: bal > 5000
              ? CustomThemes.highBalanceTheme
              : bal < 1000
                  ? CustomThemes.lowBalanceTheme
                  : CustomThemes.origTheme,
          home: LandingScreen(),
        );
      }),
    );
  }
}
