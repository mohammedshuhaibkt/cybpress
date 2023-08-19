
import 'package:cybpress/pages/doctor_list/doctor_list_view.dart';
import 'package:flutter/material.dart';





void main() {
  runApp(MaterialApp(


    home: doctorlist(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.black,
        selectionHandleColor: Colors.black,
      ),
    ),
  ));
}

