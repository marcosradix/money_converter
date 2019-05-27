
import 'package:flutter/material.dart';

import 'circleIconButton.dart';

class BuildTextField extends StatelessWidget {
final String texto;
final String simbolo;
TextEditingController textController = TextEditingController();
final Function(String dateTime) onChangeValue;

  BuildTextField({this.texto, this.simbolo, this.textController, this.onChangeValue});

  @override
  Widget build(BuildContext context) {
    return  TextField(

      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
          labelText: texto,
          labelStyle:
          TextStyle(fontSize: 26.0, color: Colors.amber),
          border: OutlineInputBorder(),
          suffixIcon: CircleIconButton(
            onPressed: (){
              this.textController.clear();
            },
          ),
          prefixStyle: TextStyle(color: Colors.amber),
          prefixText: simbolo
      ),
      style: TextStyle(color: Colors.amber, fontSize: 25.0),
      controller: this.textController,
      onChanged: (value) { onChangeValue(value); },
    );
  }
}
