import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color getColor(BuildContext context, double percent) {
  if (percent >= .50) {
    return Theme.of(context).primaryColor;
  } else if (percent >= .25) {
    return Colors.orange;
  }
  return Colors.red;
}
