import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newtest/control/providers/providers.dart';
import 'package:newtest/model/database/hive_objects/counter_objects.dart';
import 'package:newtest/view/initpage.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter("CounterDataBase");
  Hive.registerAdapter(CounterObjectAdapter());

  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NumberState())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const InitPage();
  }
}
