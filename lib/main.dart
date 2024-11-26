import 'package:flutter/material.dart';
import 'package:quiz_app/Q/A.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;

  void checkAnswer(String selectedAnswer) {
    if (quizQuestions[currentQuestion].correctAnswer == selectedAnswer) {
      setState(() {
        score = score + 10;
      });
    }
    setState(() {
      if (currentQuestion < quizQuestions.length - 1) {
        currentQuestion++;
      } else {
        // Show final score dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Quiz Completed!"),
            content: Text("Your score is $score/${quizQuestions.length * 10}"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    // Reset quiz
                    currentQuestion = 0;
                    score = 0;
                  });
                },
                child: const Text("Restart"),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Question = quizQuestions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz Game",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                Question.question,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ...Question.answers.map((answer) {
              return Container(
                margin: const EdgeInsets.all(10),
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.amber),
                  onPressed: () => checkAnswer(answer),
                  child: Text(
                    answer,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            Text(
              "Score: $score",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
