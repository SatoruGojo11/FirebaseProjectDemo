import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextFormField textFormField(
  ctrl, {
  String? hintText,
  String? labelText,
  List<TextInputFormatter>? inputFormatters,
}) {
  return TextFormField(
    controller: ctrl,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintText: hintText,
      labelText: labelText,
      fillColor: Colors.blue.withOpacity(0.4),
    ),
    inputFormatters: inputFormatters,
    validator: (value) {
      if (value!.isEmpty) {
        return "These field Can't be Empty";
      } else {
        return null;
      }
    },
  );
}
