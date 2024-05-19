import 'package:flutter/material.dart';
import 'package:mobi_games/design/design.dart';
import 'package:mobi_games/games/flappy_bird.dart';
import 'package:mobi_games/games/hammer_game.dart';
import 'package:mobi_games/games/reaction_time.dart';
import 'package:mobi_games/games/snake.dart';
import 'package:mobi_games/games/tic_tac_toe.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: Container(
        color: AppColors.primaryColor,
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildMenuItem(context, 'Flappy Bird Game', const FlappyBird()),
            _buildMenuItem(context, 'Hammer Game', const HammerGame()),
            _buildMenuItem(context, 'Reaction Time Game', const ReactionTime()),
            _buildMenuItem(context, 'Snake Game', const SnakeGame()),
            _buildMenuItem(context, 'TIC TAC TOE Game', const TicTacToe()),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
