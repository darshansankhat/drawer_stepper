import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drawer_provider extends ChangeNotifier
{
  int Continue=0;

  void nextStap()
  {
    if(Continue<3)
      {
        Continue++;

        notifyListeners();
      }
  }

  void backStap()
  {
    if(Continue>0)
    {
      Continue--;
      notifyListeners();
    }

  }

  DateTime c1=DateTime.now();

  void choiceDate(DateTime c2)
  {
    c1=c2;

    notifyListeners();
  }

  TimeOfDay t1=TimeOfDay.now();

  void choiceTime(TimeOfDay t2)
  {
    t1=t2;

    notifyListeners();
  }
}