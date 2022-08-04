import 'package:flutter/material.dart';


class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
    required this.size,
    required this.tabController,
  }) : super(key: key);

  final Size size;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: size.height * 0.07,
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: DefaultTabController(
            length: 5,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              labelColor: Colors.black,
              automaticIndicatorColorAdjustment: true,
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  backgroundColor: Colors.amber),
              isScrollable: true,
              unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0x00686666)),
              unselectedLabelColor: const Color(0xFFBDBDBD),
              controller: tabController,
              tabs: [
                const Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Available"),
                  ),
                ),
                Tab(
                  child: Container(child: const Text('Pending')),
                ),
                Tab(
                  child: Container(child: const Text('Sold')),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}