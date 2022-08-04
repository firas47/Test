import 'package:flutter/material.dart';

TextFormField buildNameFormField(String? field,TextEditingController controller ) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.text,
    onSaved: (newValue) => field = newValue,


    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $field';
      }
      return null;
    },
    decoration:  InputDecoration(
      hintText: 'enter the pets $field ',
      labelText: '$field',
      suffixIcon: Icon(Icons.pets),
    ),

  );
}