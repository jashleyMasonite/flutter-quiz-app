import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView (
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  child: Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: CircleAvatar(
                        backgroundColor: data['user_answer'] == data['correct_answer'] ? Colors.cyanAccent : Colors.purpleAccent,
                        maxRadius: 16,
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 12
                          ),
                        )
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16
                          ),
                          textAlign: TextAlign.left
                      ),
                      const SizedBox(height: 5,),
                      Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                              color: Colors.deepPurple[50],
                              fontSize: 14
                          ),
                      ),
                      Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                              color: Colors.cyanAccent,
                              fontSize: 14
                          ),
                      ),
                      const SizedBox(height: 10,),
                  ]),
                )
            ]);
          },
          ).toList(),
        )
      )
    );
  }
}