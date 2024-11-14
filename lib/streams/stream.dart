import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.pinkAccent,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.cyan
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int count) => colors[count % colors.length],
    );
  }
}

class NumberStream {
  final StreamController<int> streamController = StreamController<int>();

  void addNumberToSink(int number) {
    streamController.sink.add(number);
  }

  close() {
    streamController.close();
  }
}