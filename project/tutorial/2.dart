import 'dart:convert';

import 'package:http/http.dart' as http;

final API_URL = Uri.parse('http://localhost:8000/api/');

void main() async {
  await http
      .get(API_URL)
      .then((res) {
        var result = jsonDecode(res.body);
        print(result.runtimeType);
      })
      .catchError((e) => print(e));
}
