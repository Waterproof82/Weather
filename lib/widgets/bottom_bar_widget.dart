import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar(
    this.controller, {
    Key? key,
    required this.isEnglish,
  }) : super(key: key);
  final TabController controller;

  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      child: TabBar(
        controller: controller,
        indicator: const BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
        tabs: [
          Tab(icon: const Icon(Icons.location_city, color: Color.fromARGB(255, 255, 255, 255)), text: (isEnglish) ? 'London' : 'Londres'),
          const Tab(icon: Icon(Icons.directions_transit, color: Colors.orangeAccent), text: 'Toronto'),
          Tab(icon: const Icon(Icons.flight, color: Colors.amberAccent), text: (isEnglish) ? 'Singapore' : 'Singapur'),
          Tab(icon: const Icon(Icons.contact_mail, color: Color.fromARGB(255, 1, 102, 196)), text: (isEnglish) ? 'Contact' : 'Contacto'),
        ],
      ),
    );
  }
}
