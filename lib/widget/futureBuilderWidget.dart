
import 'package:flutter/material.dart';
import 'package:money_converter/services/currencyService.dart';

class FutureBuilderWidget extends StatelessWidget {
final CurrencyService currencyService;
  FutureBuilderWidget({this.currencyService});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: currencyService.getCurrencies(),
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
            return Container(
              child: Center(
                child: Text(
                  "${snapshot.data['results']['currencies']}",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              ),
              color: Colors.grey,
            );
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
