import 'package:flutter/material.dart';

showSnakbar(BuildContext context, String txt) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(txt)));
}
