import 'dart:convert';
import 'package:flutter/material.dart';

class ResultForm extends StatelessWidget {
  final String result;

  const ResultForm(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> textFields = [];

    try {
      if (result.isNotEmpty) {
        Map<String, dynamic> resultFields = jsonDecode(result);
        resultFields.forEach((key, value) {
          textFields.add(
            TextField(
              controller: TextEditingController()..text = value.toString(),
              decoration: InputDecoration(
                labelText: key,
              ),
            ),
          );
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print("Failed to parse _result: $e");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: textFields,
    );
  }
}
