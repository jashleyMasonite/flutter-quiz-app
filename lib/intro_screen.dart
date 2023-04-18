import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen(void Function() this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 300,
                  color: const Color.fromARGB(150, 255, 255, 255),
              ),
              const SizedBox(height: 60),
              Text(
                  "Learn Flutter the fun way!",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24
                  )
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                icon: const Icon(Icons.arrow_right_alt),
                onPressed: startQuiz,
                label: const Text(
                    'Start Quiz',
                    style: TextStyle(
                      color: Colors.white,
                    )
                ),
              ),
            ]
        )
    );
  }
}