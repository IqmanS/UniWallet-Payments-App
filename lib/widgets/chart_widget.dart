import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fampay_hack/provider/wallet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionData = Provider.of<Wallet>(context, listen: false);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        // color: Colors.amber,
        border: Border.all(width: 1.5, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Sparkline(
              gridLineAmount: 6,
              gridLineWidth: 1,
              useCubicSmoothing: true,
              cubicSmoothingFactor: 0.2,
              data: transactionData.transaction,
              enableThreshold: false,
              enableGridLines: true,
              averageLine: false,
              gridLinelabel: (_) => "",
              min: 1000,
              fillMode: FillMode.below,
              fillColor: Theme.of(context).primaryColor.withOpacity(0.15),
              lineColor: Theme.of(context).primaryColor,
              fallbackHeight: 220,
              max: 5000,
              pointsMode: PointsMode.all,
              pointColor: Theme.of(context).primaryColor,
              pointSize: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Transaction History",
                  style: Theme.of(context).textTheme.headline2),
            )
          ],
        ),
      ),
    );
  }
}
