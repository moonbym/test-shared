import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumberState extends ChangeNotifier {
  static int? counter;
  getdata() async {
    SharedPreferences numdata = await SharedPreferences.getInstance();
    if (numdata.containsKey("counter")) {
      counter = numdata.getInt("counter");
    } else {
      counter = 0;
    }
    notifyListeners();
  }

  plus() async {
    SharedPreferences numdata = await SharedPreferences.getInstance();
    counter = counter! + 1;
    numdata.setInt("counter", counter!);
    notifyListeners();
  }

  minus() async {
    SharedPreferences numdata = await SharedPreferences.getInstance();
    counter = counter! - 1;
    numdata.setInt("counter", counter!);
    notifyListeners();
  }
}
