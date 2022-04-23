import 'package:flutter/material.dart';
import 'package:flutter_codigo5_quiz/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<String> questions = [
  //   "El hombre llegó a la luna?",
  //   "La tierra es plana?",
  //   "Desayunaron?",
  // ];
  //
  // List<bool> answers = [
  //   true,
  //   false,
  //   false,
  // ];
  QuizBrain mastasquita = QuizBrain();
  List<Icon> scoreKeeper = [];
  int correct = 0;
  int incorrect = 0;

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = mastasquita.getQuestionAnswer();

    if (correctAnswer == userAnswer) {
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Color(0xff00E1B7),
        ),
      );
      correct++;
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Color(0xfff84073),
        ),
      );
      incorrect++;
    } //Else
  }

  void isFinished() {
    if (mastasquita.isFinished()) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Atencion",
        desc: "Tu Score: $correct de 4",
        buttons: [
          DialogButton(
            child: Text(
              "reiniciar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              mastasquita.restart();
              scoreKeeper = [];
              correct = 0;
              incorrect = 0;

              setState(() {});
            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272C2F),
      appBar: AppBar(
        backgroundColor: Color(0xff272C2F),
        title: const Text("QuizApp"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                mastasquita.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: const Color(0xff00E1B7),
                child: const Text("Verdadero"),
                onPressed: () {
                  checkAnswer(true);
                  mastasquita.nextQuestion();
                  setState(() {});
                  isFinished();
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: const Color(0xfff84073),
                child: const Text("False"),
                onPressed: () {
                  checkAnswer(false);
                  mastasquita.nextQuestion();
                  setState(() {});
                  isFinished();
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
