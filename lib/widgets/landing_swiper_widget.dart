import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class LandingSwiper extends StatelessWidget {
  const LandingSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Swiper(
        pagination: SwiperPagination(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Theme.of(context).primaryColor.withOpacity(0.4),
          );
        },
      ),
    );
  }
}
