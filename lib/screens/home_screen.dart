import 'package:app_ticket/screens/hotels_screen.dart';
import 'package:app_ticket/screens/ticket_screen.dart';
import 'package:app_ticket/utils/app_info_lists.dart';
import 'package:app_ticket/utils/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          const Gap(40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( 
                        "Good moring",
                        style: Styles.headLineStyle3,
                      ),
                      const Gap(5),
                      Text(
                        "Book Ticket",
                        style: Styles.headLineStyle1,
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/img/travel.png"),
                      ),
                    ),
                  )
                ],
              ),
              const Gap(25),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF4F4FD)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: [
                    Icon(FluentSystemIcons.ic_fluent_search_regular),
                    Text(
                      "Search",
                      style: Styles.headLineStyle4,
                    )
                  ],
                ),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming Flights",
                    style: Styles.headLineStyle2,
                  ),
                  InkWell(
                    child: Text(
                      "View all",
                      style: Styles.textStyle.copyWith(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
          const Gap(20),
          SingleChildScrollView(
            padding: EdgeInsets.only(right: 16),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: listTickets
                    .map((singleTicket) => TicketView(ticket: singleTicket))
                    .toList()),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hotels",
                  style: Styles.headLineStyle2,
                ),
                InkWell(
                  child: Text(
                    "View all",
                    style: Styles.textStyle.copyWith(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Row(
                  children: hotelList
                      .map((singleHotel) => HotelScreen(hotel: singleHotel))
                      .toList()))
        ],
      ),
    );
  }
}
