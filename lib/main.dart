import 'package:flutter/material.dart';
import 'package:flutter_navigation_starter/models/preferences.dart';
import 'package:flutter_navigation_starter/pages/page_login.dart';
import 'package:flutter_navigation_starter/tabs.dart';

/* 
Lancez flutter pub get avant de lancer le projet
 */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /* 
  Séquence d'initialisation
   */
  await beforeLaunch();

  // Lancement du projet
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        initialRoute: Preferences.getHomepage(),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => Tabs(),
          '/login': (BuildContext context) => PageLogin(),
        });
  }
}

/* 
Insérer le code de l'initialisation ici (ex. geolocalisation, BDD, etc...)
 */
Future beforeLaunch() async {
  await Preferences.init();
}
