import 'package:app_cep_turma/controllers/cep_controller.dart';
import 'package:app_cep_turma/widgets/result_form.dart';
import 'package:app_cep_turma/widgets/search_cep_button.dart';
import 'package:app_cep_turma/widgets/search_cep_textfield.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});
  
  @override
  // ignore: library_private_types_in_public_api
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final _controller = CepController();
  final _searchCepController = TextEditingController();
  String _result = '';
  bool _enableField = true;

  @override
  void dispose() {
    super.dispose();
    _searchCepController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar CEP'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SearchCepTextField(_searchCepController, _enableField),
            SearchCepButton(_controller, _searchCepController, _searchCep, _enableField),
            ResultForm(_result)
          ],
        ),
      ),
    );
  }

  void _searching(bool enable) {
    setState(() {
      _result = enable ? '' : _result;
      _controller.loading = enable;
      _enableField = !enable;
    });
  }

  Future _searchCep() async {
    _searching(true);

    final cep = _searchCepController.text;

    final resultCep = await _controller.cepResult(cep);

    // ignore: avoid_print
    print(resultCep.localidade);

    setState(() {
      _result = resultCep.toJson();
    });

    _searching(false);
  }
}
