import 'package:flutter/material.dart';

import 'Components/EditForm.dart';

class EditPet extends StatelessWidget {
  const EditPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar : buildAppBar(size,context),
      body: const EditForm(),
    );
    
  }
  AppBar buildAppBar(Size size,BuildContext context) {
    return AppBar(
      title: const Text('Edit Pet' ),
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

