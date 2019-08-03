import 'package:flutter/material.dart';
import 'package:money_converter/services/currencyService.dart';
import 'widget/futureBuilderWidget.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CurrencyService currencyService = new CurrencyService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffbe5e24),
        appBar: AppBar(
          title: Text(" \$ Conversor de moeda \$"),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: Home(currencyService: currencyService),
      ),
      theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.amber),
    );
  }
}
