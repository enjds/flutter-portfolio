import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:quiz_app/models/models.dart';
import 'db.dart';

class Global {
  // App Data
  static final String title = 'QuizApp';

  // Services
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

  // Data Models
  static final Map models = {
    Topic: (data) => Topic.fromMap(data),
    Quiz: (data) => Quiz.fromMap(data),
    Report: (data) => Report.fromMap(data)
  };

  // Firestore References for Writes
  static final Collection<Topic> topicsRef = Collection<Topic>(path: 'topics');
  static final UserData<Report> reportRef = UserData<Report>(collection: 'reports');
}