import 'package:flutter/material.dart';
import 'package:novely/widgets/dialogue_box.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgrounds/blue_sea.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Character sprite
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/characters/Aiko_SummerUni_Pony_Smile.png',
              height: MediaQuery.of(context).size.height * 0.8,
              fit: BoxFit.contain,
            ),
          ),
          // Dialogue box placeholder
          Align(
            alignment: Alignment.bottomCenter,
            child: DialogueBox(
              dialogues: [
                "Aiko: Welcome to this world!",
                "Aiko: I hope you enjoy your journey.",
                "Aiko: Let's begin our adventure!"
              ],
              onDialogueComplete: () {
                print("Dialogue finished!");
              },
            ),
          ),
        ],
      ),
    );
  }
}
