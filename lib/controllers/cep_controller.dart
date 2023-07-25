import 'package:app_cep_turma/services/cep_service.dart';
import '../models/cep_result_model.dart';

class CepController {
  CepResultModel? cepResultModel;

  bool loading = false;

  Future<CepResultModel> cepResult(String cep) async {
    final resultCep = await ViaCepService.fetchCep(cep: cep);
    return resultCep;
  }
}