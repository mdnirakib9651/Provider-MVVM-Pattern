import 'package:bandspicker/utils/styles.dart';
import 'package:flutter/material.dart';
import '../Custom/navigation_custom.dart';
import 'NavigationBar Screen/account.dart';
import 'NavigationBar Screen/booking.dart';
import 'NavigationBar Screen/home.dart';
import 'NavigationBar Screen/message.dart';

class NavigationBarDemo extends StatefulWidget {
  const NavigationBarDemo({Key? key}) : super(key: key);

  @override
  State<NavigationBarDemo> createState() => _NavigationBarDemoState();
}

class _NavigationBarDemoState extends State<NavigationBarDemo> {
  int index = 0;
  final screens = [
    HomePage(),
    Booking(),
    Messages(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade200,
            labelTextStyle: MaterialStateProperty.all(
              LatoRegular.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            )),
        child: NavigationBar(
          backgroundColor: Color(0xFFf1f5fb),
          // animationDuration: Duration(seconds: 2),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationBarCustom(
                icon: Icons.home_outlined,
                selecIcon: Icons.home,
                title: "Home"),
            NavigationBarCustom(
                icon: Icons.my_library_books_outlined,
                selecIcon: Icons.my_library_books,
                title: "Bookings"),
            NavigationBarCustom(
                icon: Icons.message_outlined,
                selecIcon: Icons.message,
                title: "Message"),
            NavigationBarCustom(
                icon: Icons.person_outline,
                selecIcon: Icons.person,
                title: "Accounts"),
          ],
        ),
      ),
    );
  }
}
