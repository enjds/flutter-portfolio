import 'package:flutter/material.dart';
import 'package:quiz_app/models/topic_model.dart';
import 'package:quiz_app/constants.dart';

class QuizList extends StatelessWidget {
  final Topic topic;
  const QuizList({Key key, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: topic.quizzes.map((quiz) {
        return Card(
          shape: kQuizCardShape,
          margin: kQuizCardMargin,
          elevation: kQuizCardElevation,
          child: InkWell(
            child: Container(
              padding: kQuizCardPadding,
              child: ListTile(
                title: Text(quiz.title, style: Theme.of(context).textTheme.title),
                subtitle: Text(quiz.description, overflow: kQuizCardOverflow, style: Theme.of(context).textTheme.subhead,),
                // TODO: Implement quiz badge
              ),
             
            ),
          ),
        );
      }).toList(),
    );
  }
}