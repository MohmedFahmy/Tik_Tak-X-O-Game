import 'package:flutter/material.dart';
import 'package:tictak_game/game_logic.dart';

class GameBoard extends StatelessWidget {
  final void Function(int) onTap;
  final bool gameOver;

  const GameBoard({super.key, required this.onTap, required this.gameOver});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16.0),
      crossAxisCount: 3,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: 1.0,
      children: List.generate(
        9,
        (index) => InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: gameOver ? null : () => onTap(index),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(
                  Player.playerX.contains(index)
                      ? 'X'
                      : Player.playerO.contains(index)
                      ? 'O'
                      : '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 60,
                    color: Player.playerX.contains(index)
                        ? Colors.blue
                        : Colors.pink,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
