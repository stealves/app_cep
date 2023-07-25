import 'package:flutter/material.dart';

class SearchCepTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool enableField;

  const SearchCepTextField(this.controller, this.enableField, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(labelText: 'Cep'),
      controller: controller,
      enabled: enableField,
    );
  }
}
