import 'package:flutter/material.dart';
import 'widget/futureBuilderWidget.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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
        body: Home(),
        floatingActionButton: Visibility(
          visible: true,
          child: showFloatingActionButtonHideKeyBoard(),
        ),
      ),
      theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.amber),
    );
  }

  Widget showFloatingActionButtonHideKeyBoard() {
    return FloatingActionButton(
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Icon(
        Icons.close,
        size: 20.0,
        color: Colors.brown,
      ),
      backgroundColor: Colors.amber,
      tooltip: "Fechar teclado",
    );
  }
}
