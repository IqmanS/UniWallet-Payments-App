import 'package:flutter/material.dart';

class UPIIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  const UPIIconButton({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(icon),
          ),
          Container(
            height: 32,
            child: Text(
              label,
              softWrap: true,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
            ),
          )
        ],
      ),
    );
  }
}
