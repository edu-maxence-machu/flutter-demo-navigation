import 'package:flutter/material.dart';
import 'package:flutter_navigation_starter/models/preferences.dart';

class PageLogin extends StatefulWidget {
  PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Preferences.setLoggedIn(context, true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
