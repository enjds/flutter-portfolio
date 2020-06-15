import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/services/global_service.dart';
import 'package:quiz_app/shared/shared.dart';
import 'package:quiz_app/models/models.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Global.topicsRef.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Topic> topics = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text('Topics'),
                backgroundColor: Colors.deepPurple,
                actions: <Widget>[
                  IconButton(
                    icon: kAppBarUserIcon,
                    onPressed: () => Navigator.pushNamed(context, '/profile'),
                  ),
                ],
              ),
              body: GridView.count(
                primary: false,
                padding: kGridPadding,
                crossAxisSpacing: kGridCrossAxisSpace,
                crossAxisCount: kGridCrossAxisCount,
                children: topics.map((topic) => TopicItem(topic: topic)).toList(),
              ),
              bottomNavigationBar: AppBottomNav(),
            );
          } else {
            return LoadingScreen();
          }
        });
  }
}
