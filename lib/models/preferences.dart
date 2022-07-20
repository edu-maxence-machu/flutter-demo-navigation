import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Preferences {
  static FlutterSecureStorage? secureStorage;
  static String? jwt;
  static bool loggedIn = false;

  static Future init() async {
    try {
      secureStorage = const FlutterSecureStorage();
      jwt = await secureStorage?.read(key: 'jwt');

      print("jwt: is ${jwt}");
      loggedIn = (jwt != null);
    } catch (e) {
      throw Exception(e);
    }
  }

  static void setLoggedIn(BuildContext context, bool loggedIn) {
    /* Simulatiuon du JWT récupéré depuis l'API */
    const _tokenFromAPI =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

    print("My user is logged in: $loggedIn");

    if (loggedIn) {
      loggedIn = true;
      secureStorage
          ?.write(key: 'jwt', value: _tokenFromAPI)
          .then((value) => {Navigator.pushNamed(context, '/')});
    } else {
      loggedIn = false;
      secureStorage
          ?.delete(key: 'jwt')
          .then((value) => {Navigator.pushNamed(context, '/login')});
    }
  }

  static String getHomepage() {
    /* 
    Bien entendu, il faudrait vérifier le jwt grâce à l'API pour savoir 
    si l'utilisateur est connecté ou non et si le Token est valide.
     */
    if (jwt != null) {
      return '/';
    } else {
      return '/login';
    }
  }
}
