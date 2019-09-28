import 'package:flutter/material.dart';
import 'myApp.dart';
import 'package:provider/provider.dart';

import 'notifier/focusNotifier.dart';


void main() {
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(builder: (context) => FocusNotifier(false)),
    ],
    child: MaterialApp(
    title: "Money Converter",
    color: Colors.amber,
    home: MyApp(),
  ),
  ));

}

