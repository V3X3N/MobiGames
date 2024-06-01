import 'package:flutter/material.dart';
import 'package:mobi_games/design/colors.dart';
import 'package:mobi_games/pages/main_menu.dart';

class HammerGame extends StatelessWidget {
  const HammerGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hammer Game'),
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
            'This is Hammer Game',
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
