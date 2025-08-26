import 'package:flutter/material.dart';

class TurnText extends StatelessWidget {
  final String activePlayer;
  final int turnCount; 

  const TurnText({
    super.key,
    required this.activePlayer,
    required this.turnCount,
  });

  @override
  Widget build(BuildContext context) {
    
    if (turnCount == 9) {
      return const Text(
        'Game Over',
        style: TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      );
    }

   
    Color playerColor = activePlayer == 'X' ? Colors.blue : Colors.pink;

    return Text(
      'It\'s $activePlayer turn',
      style: TextStyle(
        fontSize: 40,
        
        color: playerColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}

