import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/models.dart';
import 'package:quiz_app/screens/screens.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;
  const TopicItem({Key key, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: topic.img,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TopicDetailScreen(topic: topic),
              ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/covers/${topic.img}', fit: BoxFit.contain),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: kTopicItemPadding,
                        child: Text(
                          topic.title,
                          style: kTopicItemTextStyle,
                          overflow: kTopicItemOverflow,
                          softWrap: kTopicItemSoftWrap,
                        ),
                      ),
                    )
                  ],
                ),
               // TODO: Implement user progress on specific topic
              ],
            ),
          ),
        )
      ),
    );
  }
}