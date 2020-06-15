import 'package:apple_sign_in/apple_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/services/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();
  @override
  void initState() {
    super.initState();
    auth.getUser.then((user) {
      if(user != null) {
        Navigator.pushReplacementNamed(context, '/topics');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(size: kLoginLogoSize),
            Text('Login to Start', style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,),
            Text('Your tagline'),
            LoginButton(
              text: 'LOGIN WITH GOOGLE',
              icon: FontAwesomeIcons.google,
              color: Colors.black45,
              loginMethod: auth.googleSignIn,
            ),
            FutureBuilder(
              future: auth.appleSignInAvailable,
              builder: (context, snapshot) {
                if(snapshot.data == true) {
                  return AppleSignInButton(
                    onPressed: () async {
                      FirebaseUser user = await auth.appleSignIn();
                      if( user !=null) {
                        Navigator.pushReplacementNamed(context, '/topics');
                      }
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
            LoginButton(text: 'Continue as Guest', loginMethod: auth.anonLogin)
          ],
        ),
      )
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton({ Key key, this.color, this.text, this.icon, this.loginMethod }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kLoginButtonBottomMargin,
      child: FlatButton.icon(
        padding: kLoginButtonPadding,
        icon: Icon(icon, color: kLoginButtonIconColor),
        color: color,
        onPressed: () async {
          var user = await loginMethod();
          if(user != null) {
            Navigator.pushReplacementNamed(context, '/topics');
          }
        },
        label: Expanded(
          child: Text('$text', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}