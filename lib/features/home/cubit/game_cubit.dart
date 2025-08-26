import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictak_game/features/home/cubit/game_state.dart';

import '../../../game_logic.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(const GameState());

  final Game game = Game();

  void resetGame() {
    Player.playerX = [];
    Player.playerO = [];
    emit(const GameState());
  }

  Future<void> handleTap(int index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.playGame(index, state.activePlayer);
      _updateState();
    }

    if (!state.gameOver && !state.isSwitched && state.turn < 9) {
      await game.autoPlay(state.activePlayer);
      _updateState();
    }
  }

  void toggleMode(bool value) {
    emit(state.copyWith(isSwitched: value));
  }

  void _updateState() {
    String nextPlayer = state.activePlayer == 'X' ? 'O' : 'X';
    int nextTurn = state.turn + 1;
    String winner = game.chrckWinner();

    if (winner != '') {
      emit(
        state.copyWith(
          gameOver: true,
          result: '$winner is the Winner!',
          winnerColor: winner == 'X' ? Colors.blue : Colors.pink,
        ),
      );
    } else if (!state.gameOver && nextTurn == 9) {
      emit(
        state.copyWith(
          turn: nextTurn,
          result: 'It\'s a Tie!',
          winnerColor: Colors.white,
        ),
      );
    } else {
      emit(state.copyWith(activePlayer: nextPlayer, turn: nextTurn));
    }
  }
}
