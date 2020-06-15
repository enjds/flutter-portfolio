import 'package:flutter/material.dart';
import 'package:quiz_app/models/topic_model.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/shared/shared.dart';

class TopicDetailScreen extends StatelessWidget {
  final Topic topic;
  const TopicDetailScreen({Key key, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: topic.img,
            child: Image.asset('assets/covers/${topic.img}', width: MediaQuery.of(context).size.width,)
          ),
          Text(
            topic.title,
            style: kTopicDetailTitleStyle
          ),
          QuizList(topic: topic),
        ],
      ),
    );
  }
}