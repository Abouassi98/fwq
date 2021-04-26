import 'package:flutter/material.dart';
import 'package:graduation_project/provider/checkProvider.dart';
import 'package:graduation_project/provider/depatmentsProvider.dart';
import 'package:graduation_project/provider/shopsProvider.dart';
import 'package:provider/provider.dart';
import 'Screens/signin_screen.dart';

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigator;

  const MyApp({Key key, this.navigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CheckProvider()),
        ChangeNotifierProvider(create: (_) => ShopsProvider()),
        ChangeNotifierProvider(create: (_) => DepartMentProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'دكاترة شو',
        theme: ThemeData(
          accentColor: Color.fromRGBO(38, 36, 39, 1),
          primaryColor: Color.fromRGBO(252, 240, 0, 1),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            headline2: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(fontSize: 12, color: Colors.grey),
            bodyText2: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        home: SigninScreen(
      
        ),
      ),
    );
  }
}
