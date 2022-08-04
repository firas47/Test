import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:petstore/Models/Pets.dart';

import 'package:http/http.dart' as http;
import 'package:petstore/Pet_List/Component/Pet_Card.dart';

import '../function.dart';

class Pending extends StatefulWidget {
  const Pending({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {


  void initState() {
    super.initState();
    futurePets = getPetById('pending');
  }

  late Future<List<Pets>?> futurePets;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FutureBuilder<List<Pets>?>(
        future: futurePets,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => PetCard(
                    press: () { },
                    name: snapshot.data![index].name,
                    category: snapshot.data![index].category.name,
                    status:snapshot.data![index].status));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}