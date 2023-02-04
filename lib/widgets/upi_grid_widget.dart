import 'package:fampay_hack/provider/buttons.dart';
import 'package:fampay_hack/widgets/upi_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UPIWidget extends StatelessWidget {
  const UPIWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
          // color: Colors.amber,
          border: Border.all(width: 1.5, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(12)),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              "UPI Money Transfer",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const Divider(),
          Container(
            height: 100,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: UPIButtons.buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              itemBuilder: (context, index) => UPIIconButton(
                icon: UPIButtons.buttons.values.toList()[index],
                label: UPIButtons.buttons.keys.toList()[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
