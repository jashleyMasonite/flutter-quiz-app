import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/results_screen.dart';


class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.chosenAnswers, required this.resetScreen});

  void Function() resetScreen = (){};

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24
                  ),
                  textAlign: TextAlign.center
              ),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                icon: const Icon(Icons.cached),
                onPressed: resetScreen,
                label: const Text(
                    'Restart Quiz',
                    style: TextStyle(
                      color: Colors.white,
                    )
                ),
              ),
            ]
          )
      )
    );
  }
}