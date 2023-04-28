import 'package:drawer_stepper/Date_picker/Date_picker.dart';
import 'package:drawer_stepper/Drawer_screen/Provider_screen/Drawer_provider.dart';
import 'package:drawer_stepper/Drawer_screen/View_screen/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Drawer_provider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context) => Home_screen(),
          "date":(context) => Date_picker(),
        },
      ),
    ),
  );
}