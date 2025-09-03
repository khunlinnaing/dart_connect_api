import 'package:http/http.dart' as http;
import 'dart:convert';

import 'tutorial/user.dart';

final base_Url = Uri.parse('http://localhost:8000/api/v2');

void main() async {
  await http
      .get(base_Url)
      .then((response) {
        List<dynamic> decodeData = jsonDecode(response.body)['results'] as List;
        List<User> users = decodeData.map((e) => User.from(e)).toList();
        users.forEach((res) => print("${res.name.first} \n"));
      })
      .catchError((e) => print(e));
}
