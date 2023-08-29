import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/control/providers/providers.dart';
import 'package:test/model/database/hive_objects/counter_object.dart';
import 'package:test/view/initpage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter("CounterDb");
  Hive.registerAdapter(CounterObjectAdapter());
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NumberState())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitPage(),
    );
  }
}
