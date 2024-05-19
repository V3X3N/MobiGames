import 'package:flutter/material.dart';
import 'package:mobi_games/design/design.dart';
import 'package:mobi_games/pages/main_menu.dart';

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIC TAC TOE'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainMenu()),
            );
          },
        ),
      ),
      body: Container(
        color: AppColors.primaryColor,
        child: const Center(
          child: Text(
            'This is TIC TAC TOE',
            style: TextStyle(
              fontSize: 24,
              color: AppColors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
