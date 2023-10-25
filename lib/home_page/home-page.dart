import 'package:flutter/material.dart';
import './button-redirection.dart';
import './find-team-input.dart';
import './sidebar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1f4037)),
        title: SizedBox(
          child: Text(
            widget.title,
            style: const TextStyle(color: Color(0xFF1f4037)),
          ),
        ),
      ),
      drawer: SideBar(),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF1f4037),
                  Color(0xFF99f2c8),
                ],
              )),
            ),
            FindTeamInput(),
            ButtonRedirection(),
          ],
        ),
      ),
    );
  }
}
