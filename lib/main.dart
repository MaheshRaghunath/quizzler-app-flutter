import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain questionBrain = QuizBrain();
void main() {
  runApp(Quizzer());
}

class Quizzer extends StatefulWidget {
  const Quizzer({Key? key}) : super(key: key);

  @override
  State<Quizzer> createState() => _QuizzerState();
}

class _QuizzerState extends State<Quizzer> {
  int showFcount = 0;
  int showTcount = 0;
  bool hited = false;
  void changeStateQuiz(bool state) {
    if (!questionBrain.answerFlag()) {
      if (showFcount < questionBrain.getLen() - 1) {
        showFcount++;
      } else {
        hited = true;
      }
    } else {
      if (showTcount < questionBrain.getLen() - 1) {
        showTcount++;
      } else {
        hited = true;
      }
    }
    //if (hited) {
    //print('Hitted....');
    // The easiest way for creating RFlutter Alert
    //}
    questionBrain.nextQuestuin();
  }

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    String questions = questionBrain.questionText();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[70],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          title: const Text('Quizzer'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              //TODO: Display questios Card
              Expanded(
                child: Card(
                  color: Colors.blueGrey[700],
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Text(
                        "Question : $questions?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size.square(50),
              ),
              //TODO: Show results
              Expanded(
                child: Column(
                  children: [
                    Card(
                      color: Colors.green[200],
                      child: ListTile(
                        leading: Text('$showTcount'),
                        subtitle: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.red[100],
                      child: ListTile(
                        leading: Text('$showFcount'),
                        subtitle: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //TODO: Buttons
              Expanded(
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              changeStateQuiz(true);
                              if (hited) {
                                print('hitted');
                                //_onBasicAlertPressed(context);
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "RFLUTTER ALERT",
                                  desc:
                                      "Flutter is more awesome with RFlutter Alert.",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "COOL",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      width: 120,
                                    )
                                  ],
                                ).show();
                              }
                              //_onAlertButtonPressed(context);
                            });
                          },
                          child: const Text(
                            'True',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green[500],
                            padding: const EdgeInsets.all(20.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              changeStateQuiz(false);
                            });
                          },
                          child: const Text(
                            'False',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.all(20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
