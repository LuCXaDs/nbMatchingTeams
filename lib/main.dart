import 'package:flutter/material.dart';
import './home_page/home-page.dart';
import './algo/nbMatchingTeams.dart';

void main() async {
  runApp(const MyApp());
  await readJsonFile();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nbMatchingTeams',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1f4037)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'nbMatchingTeams'),
    );
  }
}
