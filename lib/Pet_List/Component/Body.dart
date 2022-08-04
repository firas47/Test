import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Models/Pets.dart';
import 'Pet_Card.dart';
import 'package:http/http.dart' as http;

import 'Tabs&Pages/Tabs.dart';
import 'Tabs&Pages/TabsPages.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {



  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Tabs(size: size, tabController: tabController),
        TabPages(tabController: tabController, size: size),
      ],
    );
  }
}
