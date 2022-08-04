import 'package:flutter/material.dart';

import 'Components/AddForm.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar : buildAppBar(size,context),
      body: AddForm(),
    );
    
  }
  AppBar buildAppBar(Size size,BuildContext context) {
    return AppBar(
      title: const Text('Add Pet' ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () { Navigator.pop(context); },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.pets),
          onPressed: () {},
        ),


      ],

    );
  }
}

