import 'package:app_ticket/utils/app_layout.dart';
import 'package:app_ticket/utils/app_styles.dart';
import 'package:app_ticket/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  Map<String, dynamic> ticket;
  TicketView({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(200),
      child: Container(
        padding: EdgeInsets.only(left: AppLayout.getHeight(16)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF526799),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(21)),
                    topRight: Radius.circular(AppLayout.getHeight(21))),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      ticket['from']['code'],
                      style: Styles.headLineStyle3
                          .copyWith(color: Colors.blueAccent),
                    ),
                    Expanded(child: Container()),
                    ThickContainer(),
                    Expanded(
                        child: Stack(children: [
                      SizedBox(
                        height: AppLayout.getHeight(24),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  (constraints.constrainWidth() / 6).floor(),
                                  (index) => SizedBox(
                                        width: AppLayout.getWidth(3),
                                        height: AppLayout.getHeight(1),
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.white)),
                                      )),
                            );
                          },
                        ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: 1.5,
                          child: Icon(
                            Icons.local_airport_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ])),
                    ThickContainer(),
                    Expanded(child: Container()),
                    Text(
                      ticket['to']['code'],
                      style: Styles.headLineStyle3
                          .copyWith(color: Colors.blueAccent),
                    )
                  ],
                ),
                const Gap(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppLayout.getWidth(100),
                      child: Text(
                        ticket['from']['name'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                    ),
                    Text(
                      ticket['flying-time'],
                      style:
                          Styles.headLineStyle4.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(100),
                      child: Text(
                        ticket['to']['name'],
                        textAlign: TextAlign.end,
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              color: Color(0xFFF37867),
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppLayout.getHeight(10)),
                            bottomRight:
                                Radius.circular(AppLayout.getHeight(10)),
                          ),
                          color: Colors.white),
                    ),
                  ),
                  Expanded(child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            (constraints.constrainWidth() / 16).floor(),
                            (index) => SizedBox(
                                  width: AppLayout.getWidth(5),
                                  height: AppLayout.getHeight(1),
                                  child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                  ),
                                )));
                  })),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppLayout.getHeight(10)),
                            bottomLeft:
                                Radius.circular(AppLayout.getHeight(10)),
                          ),
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF37867),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                    bottomRight: Radius.circular(AppLayout.getHeight(21))),
              ),
              padding: EdgeInsets.only(
                  left: AppLayout.getWidth(16),
                  top: AppLayout.getHeight(10),
                  right: AppLayout.getWidth(16),
                  bottom: AppLayout.getHeight(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket['date'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                      const Gap(5),
                      Text(
                        'Date',
                        style:
                            Styles.headLineStyle4.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ticket['departure-time'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                      const Gap(5),
                      Text(
                        'Departure',
                        style:
                            Styles.headLineStyle4.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        ticket['number'].toString(),
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                      const Gap(5),
                      Text(
                        'Number',
                        style:
                            Styles.headLineStyle4.copyWith(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
