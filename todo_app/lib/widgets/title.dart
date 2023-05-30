import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget {
  const TodoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Todo App",
      style: TextStyle(color: Colors.orange, fontSize: 70),
      textAlign: TextAlign.center,
    );
  }
}
