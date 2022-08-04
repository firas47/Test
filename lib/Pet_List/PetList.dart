
import 'package:flutter/material.dart';
import 'package:petstore/Add/Add.dart';
import 'package:petstore/Edit/Edit.dart';

import 'Component/Body.dart';

class PetList extends StatelessWidget {
  const PetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar : buildAppBar(size,context),
      body: Body(),
    );

  }

  AppBar buildAppBar(Size size,BuildContext context) {
    return AppBar(
      title: const Text('Pets List' ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.pets),
        onPressed: () {  },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditPet()),
            ); },
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Add()),
          ); },
        ),


      ],

    );
  }
}
