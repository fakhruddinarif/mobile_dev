import 'package:flutter/material.dart';
import 'package:mobile_dev/navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({Key? key}) : super(key: key);

  @override
  _NavigationFirstState createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.pinkAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation First Screen Arif'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          _navigateAndGetColor(context);
        }, child: Text('Change Color')),
      ),
    );
  }

  Future _navigateAndGetColor(BuildContext context) async {
    color = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),) ?? Colors.blue;
      setState(() {});
  }
}