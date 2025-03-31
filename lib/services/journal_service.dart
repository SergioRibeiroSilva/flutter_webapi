import 'dart:convert';

import 'package:http/http.dart' as http; 

class JournalService {
  static const String url = "http://10.95.106.31:3000/";
  static const String resource = "learnhttp/";

String geturl() {
  return "$url$resource";
}

Future<void> register(String content) async {

print(geturl());

  final url = Uri.parse(geturl());
    final headers = {
    'Content-Type': 'application/json', // Definir o cabeçalho
  };  


  final body = jsonEncode({
    "content": content, // Enviar os dados em formato JSON
  });

print("antes do print body");
print(body);


  try {
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Requisição bem-sucedida");
    } else {
      print("Falha na requisição: ${response.statusCode}");
    }
  } catch (e) {
    print("Erro no http");  }    
  

  print("depois do try");

  //http.post(Uri.parse(geturl()), body: {
  //  "content": content
  //  });


}


Future<String> get() async {
  http.Response response;
  response = await http.get(Uri.parse(geturl()));   
  return response.body;

}


}