import 'package:http/http.dart' as http;
import 'dart:convert';

final base_Url = Uri.parse('http://localhost:8000/api/v2');

void main() async {
  await http
      .get(base_Url)
      .then((response) {
        var decodeData = jsonDecode(response.body);
      })
      .catchError((e) => print(e));
}
