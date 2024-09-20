import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  const MyInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Praktikum 4
    /*return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Contoh TextField")),
        body: const TextField(
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nama',
          ),
        ),
      ),
    );*/
    // Modifikasi Praktikum 4
    return TextField(
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Nama',
      ),
    );
  }
}