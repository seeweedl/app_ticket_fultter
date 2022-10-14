import 'package:app_ticket/utils/app_layout.dart';
import 'package:app_ticket/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width * 0.6,
      height: AppLayout.getHeight(350),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
          color: Color(0xFF526799),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 15,
              spreadRadius: 3,
            )
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: AppLayout.getHeight(180),
          decoration: BoxDecoration(
              color: Styles.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/${hotel['image']}"))),
        ),
        const Gap(15),
        Text(
          '${hotel['place']}',
          style: Styles.headLineStyle2.copyWith(color: Colors.orange.shade200),
        ),
        const Gap(3),
        Text(
          '${hotel['destination']}',
          style: Styles.headLineStyle3.copyWith(color: Colors.white),
        ),
        const Gap(6),
        Text(
          '\$${hotel['price']}/night',
          style: Styles.headLineStyle2.copyWith(color: Colors.orange.shade300),
        )
      ]),
    );
  }
}
