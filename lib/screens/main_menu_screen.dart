import 'package:flutter/material.dart';
import 'package:novely/screens/game_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background
          Center(
            child: SizedBox(
              width: 640,
              height: double.infinity,
              child: Image.asset(
                'assets/images/backgrounds/indomaret-background.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // User Interface
          Center(
            child: Column(
              children: [
                const SizedBox(height: 48),
                Text(
                  'C H E C K O U T',
                  style: TextStyle(
                    fontSize: 56,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(),
                      ),
                    );
                  },
                  child: Text('NEW GAME'),
                ),
                const SizedBox(height: 12),
                CustomButton(
                  onPressed: () {},
                  child: Text('LOAD GAME'),
                ),
                const SizedBox(height: 12),
                CustomButton(
                  onPressed: () {},
                  child: Text('SETTINGS'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  const CustomButton({
    super.key,
    this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
