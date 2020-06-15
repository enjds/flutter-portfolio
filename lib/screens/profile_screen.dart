import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(user.displayName ?? 'Guest'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: FlatButton(child: Text('Sign Out'), onPressed: () async {
            await auth.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          },),
        ),
      );
    } else {
      return Scaffold(
        body: Center(child: Text('not logged in..'),),
      );
    }
  }
}
