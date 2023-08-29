import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newtest/model/database/hive_objects/counter_objects.dart';
import 'package:uuid/uuid.dart';

import '../../model/database/boxes/counterboxes.dart';

class NumberState extends ChangeNotifier {
  static int counter = 0;
  static List<CounterObject> records = [];
  getcounter() async {
    Boxes.counterBox = await Hive.openBox("counterBox");
    records = Boxes.counterBox.values.toList();

    if (Boxes.counterBox.isNotEmpty) {
      counter = Boxes.counterBox.values.last.number;
    } else {
      counter = 0;
    }
    notifyListeners();
  }

  plus() async {
    Boxes.counterBox = await Hive.openBox("counterBox");
    counter++;
    Boxes.counterBox.add(CounterObject(
        number: counter,
        id: const Uuid().v1(),
        date: DateTime.now().toString()));

    notifyListeners();
  }

  //reset!!!!!!!!
  remove(key) async {
    Boxes.counterBox = await Hive.openBox("counterBox");
    counter++;
    Boxes.counterBox.delete(key);

    notifyListeners();
    //edit
  }

  minus() async {
    Boxes.counterBox = await Hive.openBox("counterBox");
    counter--;
    Boxes.counterBox.add(CounterObject(
        number: counter,
        id: const Uuid().v1(),
        date: DateTime.now().toString()));

    notifyListeners();
  }

  reset() async {
    Boxes.counterBox = await Hive.openBox("counterBox");
    counter = 0;
    Boxes.counterBox.add(CounterObject(
        number: counter,
        id: const Uuid().v1(),
        date: DateTime.now().toString()));

    notifyListeners();
  }
}
