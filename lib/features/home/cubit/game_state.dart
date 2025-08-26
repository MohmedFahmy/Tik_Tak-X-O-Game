import 'package:flutter/material.dart';

class GameState {
  final String activePlayer;
  final bool gameOver;
  final int turn;
  final String result;
  final Color winnerColor;
  final bool isSwitched;

  const GameState({
    this.activePlayer = 'X',
    this.gameOver = false,
    this.turn = 0,
    this.result = '',
    this.winnerColor = Colors.white,
    this.isSwitched = false,
  });

  GameState copyWith({
    String? activePlayer,
    bool? gameOver,
    int? turn,
    String? result,
    Color? winnerColor,
    bool? isSwitched,
  }) {
    return GameState(
      activePlayer: activePlayer ?? this.activePlayer,
      gameOver: gameOver ?? this.gameOver,
      turn: turn ?? this.turn,
      result: result ?? this.result,
      winnerColor: winnerColor ?? this.winnerColor,
      isSwitched: isSwitched ?? this.isSwitched,
    );
  }
}
