import 'package:flutter/material.dart';
import 'package:money_converter/services/currencyService.dart';

import 'buildTextField.dart';

class Home extends StatefulWidget {
  final CurrencyService currencyService;
  Home({Key key, @required this.currencyService}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  final focusDolar = FocusNode();
  final focusEuro = FocusNode();
  final focusReal = FocusNode();

  double dolar;
  double euro;

  void _realChange(String text) {
    double real = double.parse(text);
    dolarController.text = (real / this.dolar).toStringAsFixed(2);
    euroController.text = (real / this.euro).toStringAsFixed(2);
    print(text);
  }

  void _dlarChange(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = ((dolar * this.dolar) / this.euro).toStringAsFixed(2);
  }

  void _euroChange(String text) {
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / this.dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: widget.currencyService.getCurrencies(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Text(
                "Carregando dados....",
                style: TextStyle(color: Colors.amber, fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            this.dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
            this.euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
            return SingleChildScrollView(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      onDoubleTap: () {
                        print("double tap");
                        realController.clear();
                        dolarController.clear();
                        euroController.clear();
                      },
                      child: Icon(
                        Icons.monetization_on,
                        size: 150.0,
                        color: Colors.amber,
                      ),
                    ),
                    BuildTextField(
                      texto: "REAL",
                      simbolo: "R\$",
                      textController: this.realController,
                      onChangeValue: (_realChange),
                      onFocus: focusReal,
                    ),
                    Divider(),
                    BuildTextField(
                      texto: "DÓLAR",
                      simbolo: "US\$",
                      textController: this.dolarController,
                      onChangeValue: (_dlarChange),
                      onFocus: focusDolar,
                    ),
                    Divider(),
                    BuildTextField(
                      texto: "EURO",
                      simbolo: "€",
                      textController: this.euroController,
                      onChangeValue: (_euroChange),
                      onFocus: focusEuro,
                    ),
                  ],
                ));
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Erro ao carregar dados",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );
            }
        }
      },
    );
  }
}
