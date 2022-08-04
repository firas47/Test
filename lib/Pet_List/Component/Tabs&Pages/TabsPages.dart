import 'package:flutter/material.dart';

import 'Pages/Available.dart';
import 'Pages/Pending.dart';
import 'Pages/Sold.dart';


class TabPages extends StatelessWidget {
  const TabPages({
    Key? key,
    required this.tabController,
    required this.size,
  }) : super(key: key);

  final TabController tabController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: TabBarView(
            controller: tabController,
            children: [
              Available(size: size),
              Pending(size: size),
              Sold(size: size),
            ],
          ),
        ),
    );
  }
}