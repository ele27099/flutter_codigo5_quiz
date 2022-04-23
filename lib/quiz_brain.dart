import 'package:flutter_codigo5_quiz/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question(questionText: "El hombre llegó a luna?", questionAnswer: true),
    Question(questionText: "El mar es azul?", questionAnswer: true),
    Question(questionText: "Desayunaron?", questionAnswer: false),
    Question(questionText: "Van a almorzar?", questionAnswer: true),
    Question(questionText: "Hace frio?", questionAnswer: true),
  ];

  int _questionNumber = 0;

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void restart() {
    _questionNumber = 0;
  }
}
