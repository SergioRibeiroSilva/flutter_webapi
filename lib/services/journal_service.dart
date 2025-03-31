import 'dart:convert';

import 'package:flutter_webapi/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart'; 

class JournalService {
  static const String url = "http://10.95.106.31:3000/";
  static const String resource = "learnhttp/";


http.Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

String geturl() {
  return "$url$resource";
}

Future<void> register(String content) async {

  final url = Uri.parse(geturl());
    final headers = {
    'Content-Type': 'application/json', // Definir o cabeçalho
  };  


  final body = jsonEncode({
    "content": content, // Enviar os dados em formato JSON
  });


  try {
    final response = await client.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Requisição bem-sucedida");
    } else {
      print("Falha na requisição: ${response.statusCode}");
    }
  } catch (e) {
    print("Erro no http");  }    
  



}


Future<String> get() async {
  http.Response response;
  response = await client.get(Uri.parse(geturl()));   
  return response.body;

}


}