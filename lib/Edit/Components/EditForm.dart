import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Models/Pets.dart';
import 'package:http/http.dart' as http;
import 'FormFieldsComponents/TextField.dart';

class EditForm extends StatefulWidget {
  const EditForm({Key? key}) : super(key: key);

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? name, category, pictureUrl, tag;

  final idController = TextEditingController();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final idCategoryController = TextEditingController();
  final photoUrlController = TextEditingController();
  final tagsController = TextEditingController();
  final idTagsController = TextEditingController();

  bool Add = false ;

  String dropdownvalue = 'available';

  var Status = [
    'available',
    'pending',
    'sold',
  ];


  Future<Pets> createAlbum(int id, String name, Category category,
      List<String> photoUrls, List<Category> tags, String status) async {
    final response = await http.post(
      Uri.parse('https://petstore.swagger.io/v2/pet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': id,
        'name': name,
        'category': category,
        'photoUrls': photoUrls,
        'tags': tags,
        'status': status,
      }),
    );

    if (response.statusCode == 200) {

      setState(() {
        Add = true;
      });

      return Pets.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {

    final snackBar = SnackBar(
      content: const Text('Pet Added Succeffuly!'),
      action: SnackBarAction(
        label: 'back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                      width: size.width * 0.5,
                      child: buildNameFormField('id', idController)),
                  SizedBox(
                      width: size.width * 0.5,
                      child: buildNameFormField('name', nameController)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                      width: size.width * 0.5,
                      child:
                          buildNameFormField('category', categoryController)),
                  SizedBox(
                      width: size.width * 0.5,
                      child: buildNameFormField(
                          'idCategory', idCategoryController)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              buildNameFormField('PhotoUrl', photoUrlController),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                      width: size.width * 0.5,
                      child: buildNameFormField('tag', tagsController)),
                  SizedBox(
                      width: size.width * 0.5,
                      child: buildNameFormField('idTag', idTagsController)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              buildDropdownButtonFormField(),
              AddButton(size, context, snackBar),
            ],
          ),
        ),
      ),
    );
  }


  Padding AddButton(Size size, BuildContext context, SnackBar snackBar) {
    return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 30.0, horizontal: size.width * 0.3),
              child: SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.07,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      createAlbum(
                          int.parse(idController.text),
                          nameController.text,
                          Category(
                              id: int.parse(idCategoryController.text),
                              name: categoryController.text),
                          [photoUrlController.text],
                          [
                            Category(
                                id: int.parse(idTagsController.text),
                                name: tagsController.text)
                          ],
                          dropdownvalue);
                    }
                    if (Add == true){
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      setState(() {
                        Add= false;
                      });
                    }
                  },
                  child: const Text('Edit Pet'),
                ),
              ),
            );
  }

  DropdownButtonFormField<String> buildDropdownButtonFormField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Status',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),

      // Initial Value
      value: dropdownvalue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: Status.map((String Status) {
        return DropdownMenuItem(
          value: Status,
          child: Text(Status),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}
