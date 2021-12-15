import 'package:flutter/material.dart';


Color customColor({String? date}){
  switch(date){
    case 'Today':
      return Colors.brown;
    case 'Tomorrow':
      return Colors.amber;
    case 'Yesterday':
      return Colors.purple;
    default:
      return Colors.redAccent;
  }
}