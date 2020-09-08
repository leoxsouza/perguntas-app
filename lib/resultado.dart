
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final String texto;

  Resultado(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          texto,
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}