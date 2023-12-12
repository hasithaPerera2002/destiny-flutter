// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:destiny/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Destini());
}

StoryBrain storyBrain = StoryBrain();

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Text(
                      storyBrain.getStory,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: () {
                      checkAnswer(1);
                    },
                    color: Colors.red,
                    child: Text(
                      storyBrain.getChoice1,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: () {
                      checkAnswer(2);
                    },
                    color: Colors.green,
                    child: Text(
                      storyBrain.getChoice2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkAnswer(int answer) {
    int number = storyBrain.getNumber;

    setState(() {
      switch (number) {
        case 0:
          if (answer == 1) {
            storyBrain.nextQuestion(2);
          } else {
            storyBrain.nextQuestion(1);
          }
          break;
        case 1:
          if (answer == 1) {
            storyBrain.nextQuestion(2);
          } else {
            storyBrain.nextQuestion(3);
          }
          break;
        case 2:
          if (answer == 1) {
            storyBrain.nextQuestion(5);
          } else {
            storyBrain.nextQuestion(4);
          }
          break;
        case 3:
          // sendAlert();
          storyBrain.reset();

          break;
        case 4:
          storyBrain.reset();

          break;
        case 5:
          storyBrain.reset();

          break;
      }
    });
  }

  // void sendAlert() {
  //    if (quizeBrain.isFinished()) {
  //       Alert(
  //         context: context,
  //         title: "Alert betch",
  //         desc: 'Questions has end',
  //         type: AlertType.error,
  //         buttons: [
  //           DialogButton(
  //             onPressed: () => print('clicked'),
  //             width: 120,
  //             child: Text(
  //               "COOL",
  //               style: TextStyle(color: Colors.white, fontSize: 20),
  //             ),
  //           )
  //         ],
  //       ).show();
  // }
}
