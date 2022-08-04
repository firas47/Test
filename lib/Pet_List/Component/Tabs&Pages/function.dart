import 'dart:convert';

import 'package:petstore/Models/Pets.dart';
import 'package:http/http.dart' as http;

Future<List<Pets>?> getPetById(String status) async {
  final response =
  await http.get(Uri.parse('https://petstore.swagger.io/v2/pet/findByStatus?status=$status'));

  if (response.statusCode == 200) {
    List<Pets>? users = (json.decode(response.body) as List)
        .map((data) => Pets.fromJson(data))
        .toList();
    return users;
  } else {
    throw Exception('Failed to load album');
  }
}
