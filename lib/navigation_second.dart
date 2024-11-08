import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({Key? key}) : super(key: key);

  @override
  _NavigationSecondState createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen Arif'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {color = Colors.red.shade700; Navigator.pop(context, color);}, child: Text('Red')),
            ElevatedButton(onPressed: () {color = Colors.green.shade700; Navigator.pop(context, color);}, child: Text('Green')),
            ElevatedButton(onPressed: () {color = Colors.blue.shade700; Navigator.pop(context, color);}, child: Text('Blue'))
          ],
        ),
      ),
    );
  }
}