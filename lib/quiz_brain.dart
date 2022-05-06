import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  int _showTcount = 0;
  int _showFcount = 0;
  int trueAns = 0;
  int falseAns = 0;

  final List<Questions> _questionsAndAns = [
    Questions(question: 'Alliumphobia is a fear of garlic', answer: true),
    Questions(question: 'The black box in a plane is black', answer: false),
    Questions(question: 'The atomic number for lithium is 17', answer: false),
    Questions(
        question: 'A cross between a horse and a zebra is called a \'Hobra\'',
        answer: true),
    Questions(
        question: 'Prince Harry is taller than Prince William', answer: true)
  ];

  void nextQuestuin() {
    if (_questionNumber < getLen() - 1) {
      _questionNumber++;
    }
  }

  String questionText() {
    return _questionsAndAns[_questionNumber].questionText;
  }

  bool answerFlag() {
    return _questionsAndAns[_questionNumber].answerFlag;
  }

  int getLen() {
    return _questionsAndAns.length;
  }
}
