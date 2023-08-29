import 'package:flutter/material.dart';
import 'package:newtest/view/homepage.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: "Demo page"),
    );
  }
}
