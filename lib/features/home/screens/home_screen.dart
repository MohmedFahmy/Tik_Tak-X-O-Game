import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/game_cubit.dart';
import '../cubit/game_state.dart';
import '../widgets/game_board.dart';
import '../widgets/mode_switch_tile.dart';
import '../widgets/repeat_button.dart';
import '../widgets/result_text.dart';
import '../widgets/turn_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: BlocBuilder<GameCubit, GameState>(
            builder: (context, state) {
              final cubit = context.read<GameCubit>();
              return Column(
                children: [
                  const SizedBox(height: 20),
                  ModeSwitchTile(
                    isSwitched: state.isSwitched,
                    onChanged: cubit.toggleMode,
                  ),
                  const SizedBox(height: 40),
                  TurnText(activePlayer: state.activePlayer, turnCount: state.turn),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GameBoard(
                      onTap: cubit.handleTap,
                      gameOver: state.gameOver,
                    ),
                  ),
                  ResultText(result: state.result, winnerColor: state.winnerColor),
                  const SizedBox(height: 20),
                  RepeatButton(onPressed: cubit.resetGame),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
