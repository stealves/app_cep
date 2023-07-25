import 'package:app_cep_turma/models/cep_result_model.dart';
import 'package:http/http.dart' as http;


class ViaCepService {
  static Future<CepResultModel> fetchCep({String? cep}) async {
    String url = 'https://viacep.com.br/ws/$cep/json/';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return CepResultModel.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
