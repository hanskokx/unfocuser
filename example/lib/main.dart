import 'package:flutter/material.dart';
import 'package:unfocuser/unfocuser.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: MaterialApp(
        home: TextFormField(),
      ),
    );
  }
}
