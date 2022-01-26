import 'package:flutter/material.dart';

class MyTextField extends TextField {
  MyTextField({
    Key? key,
    required Color color,
    required String myLabel,
    required TextEditingController controller,
    required Function(String) onSubmitted,
  }) : super(
          key: key,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: myLabel,
          ),
          style: const TextStyle(fontSize: 22, color: Colors.green),
          onSubmitted: onSubmitted,
          controller: controller,
        );
}
