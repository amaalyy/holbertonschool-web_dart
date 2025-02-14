import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  const String apiUrl = 'https://rickandmortyapi.com/api/character';
  try {
    var response = await http.get(Uri.parse(apiUrl));

    Map jsonData = jsonDecode(response.body);

    List characters = jsonData['results'];
    for (var character in characters) {
      print(character['name']);
    }
  } catch (error) {
    print('error caught: $error');
  }
}
