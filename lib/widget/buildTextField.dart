
import 'package:flutter/material.dart';


class BuildTextField extends StatelessWidget {
final String texto;
final String simbolo;
final TextEditingController textController;
final Function(String dateTime) onChangeValue;

  BuildTextField({this.texto, this.simbolo, this.textController, this.onChangeValue});

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: TextField(
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(
              labelText: texto,
              labelStyle:
              TextStyle(fontSize: 26.0, color: Colors.amber),
              border: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              prefixStyle: TextStyle(color: Colors.amber),
              prefixText: simbolo
          ),
          style: TextStyle(color: Colors.amber, fontSize: 25.0),
          controller: textController,
          onChanged: (value) { onChangeValue(value); },
        ),
    );
  }
}
