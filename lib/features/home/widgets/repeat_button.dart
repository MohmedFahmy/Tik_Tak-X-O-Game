import 'package:flutter/material.dart';

class RepeatButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RepeatButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).shadowColor,
        ),
      ),
      onPressed: onPressed,
      label: const Text(
        'Repeat the Game',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      icon: const Icon(Icons.refresh, size: 30),
    );
  }
}
