import 'package:flutter/material.dart';
import 'package:mobi_games/design/design.dart';
import 'package:mobi_games/pages/main_menu.dart';

class ReactionTime extends StatelessWidget {
  const ReactionTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reaction Time'),
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
            'This is Reaction Time',
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
