import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, //boundaries => scrollable
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: ((data['user_answer'] as String) ==
                                        (data['correct_answer'] as String))
                                    ? Colors.blue
                                    : Colors.pink,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              ((data['question_index'] as int) + 1).toString(),
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600),
                            )),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['question'] as String,
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    height: 1),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                data['user_answer'] as String,
                                style: GoogleFonts.inter(
                                    color: Colors.pinkAccent,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                data['correct_answer'] as String,
                                style: GoogleFonts.inter(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
