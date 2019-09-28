import 'package:flutter/material.dart';
import 'notifier/focusNotifier.dart';
import 'widget/futureBuilderWidget.dart';
import 'package:provider/provider.dart';


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
          child: Selector<FocusNotifier, bool>(
            selector: (context, focus) => focus.onFocus,
            builder: (context, focus, child){
            return showFloatingActionButtonHideKeyBoard(focus);
          }
          ),
        ),
      ),
      theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.amber),
    );
  }

  Widget showFloatingActionButtonHideKeyBoard(bool myFocus) {
    return myFocus == true  ? FloatingActionButton(
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
    ):Container();
}
    
}
