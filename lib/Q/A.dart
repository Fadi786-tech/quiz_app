class Questions {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  Questions({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

// List<Map<dynamic, dynamic>> QaN = [
//   {
//     'question': "What's the capital of Pakistan?",
//     'answers': ["Lahore", "Karachi", "Islamabad", "Multan"],
//     'correctAnswers': 3
//   },
//   {
//     'question': "What is the largest planet?",
//     'answers': ["Earth", "Mars", "Jupiter", "Venus"],
//     'correctAnswers': 3
//   },
//   {
//     'question': "What is 5 + 3?",
//     'answers': ["5", "8", "10", "15"],
//     'correctAnswers': 1
//   },
// ];
List<Questions> quizQuestions = [
  Questions(
    question: "What is the capital of France?",
    answers: ["Paris", "Berlin", "Madrid", "Rome"],
    correctAnswer: "Paris",
  ),
  Questions(
    question: "What is 2 + 2?",
    answers: ["3", "4", "5", "6"],
    correctAnswer: "4",
  ),
  Questions(
    question: "Which programming language is used for Flutter?",
    answers: ["Java", "Dart", "Python", "C++"],
    correctAnswer: "Dart",
  ),
];
