import 'package:fampay_hack/provider/themes.dart';
import 'package:fampay_hack/widgets/chart_widget.dart';
import 'package:fampay_hack/widgets/fin_lit_grid.dart';
import 'package:fampay_hack/widgets/landing_swiper_widget.dart';
import 'package:fampay_hack/widgets/upi_grid_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProviderData =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () =>
                themeProviderData.changeTheme(SelectTheme.origTheme),
            icon: const Icon(CupertinoIcons.qrcode_viewfinder),
          ),
          IconButton(
            onPressed: () =>
                themeProviderData.changeTheme(SelectTheme.lowBalanceTheme),
            icon: const Icon(Icons.filter_1),
          ),
          IconButton(
            onPressed: () =>
                themeProviderData.changeTheme(SelectTheme.highBalanceTheme),
            icon: const Icon(Icons.ac_unit),
          )
        ],
      ),
      body: ListView(
        children: const [
          SizedBox(height: 4),
          LandingSwiper(),
          UPIWidget(),
          FinLitGrid(),
          ChartWidget(),
          SizedBox(
            height: 200,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.qr_code,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
