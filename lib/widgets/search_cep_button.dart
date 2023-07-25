import 'package:app_cep_turma/controllers/cep_controller.dart';
import 'package:flutter/material.dart';

class SearchCepButton extends StatelessWidget {
  final CepController controller;
  final TextEditingController searchCepController;
  final Function searchCep;
  final bool enableField;

  const SearchCepButton(this.controller, this.searchCepController, this.searchCep, this.enableField, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
        onPressed: enableField ? () => searchCep() : null,
        child: controller.loading ? _circularLoading() : const Text('Consultar'),
      ),
    );
  }

  Widget _circularLoading() {
    return const SizedBox(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }
}
