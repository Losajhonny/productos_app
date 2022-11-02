import 'package:flutter/material.dart';

/*
Aplica una decoración a los inputs del formulario del login
- Agrega un icono en el lado izquierdo del input
- Coloca color morado al borde
- Coloca el placeholder (hintText)
- Label del input
*/
class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2,
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: Colors.deepPurple,
            )
          : null,
    );
  }
}
