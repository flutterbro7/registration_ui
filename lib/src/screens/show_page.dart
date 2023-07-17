import 'package:flutter/material.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({Key? key}) : super(key: key);

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Welcome to @flutter.bro",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}
