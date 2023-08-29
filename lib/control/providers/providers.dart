import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test/model/database/boxes/boxes.dart';
import 'package:test/model/database/hive_objects/counter_object.dart';

class NumberState extends ChangeNotifier {
  static int? counter;
  getdata() async {
    notifyListeners();
  }

  plus() async {
    Box<CounterObject> counterbox = await Hive.openBox("counterbox");
    counter = counter! + 1;
    numdata.setInt("counter", counter!);
    notifyListeners();
  }

  minus() async {
    counter = counter! - 1;
    numdata.setInt("counter", counter!);
    notifyListeners();
  }
}
