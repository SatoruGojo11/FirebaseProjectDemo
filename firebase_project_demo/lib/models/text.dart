import 'package:flutter/material.dart';

Text text(name, {size, color, fw}) {
  return Text(
    '$name',
    style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size ?? 20.0,
        fontWeight: fw ?? FontWeight.normal),
  );
}
