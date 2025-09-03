import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Post.dart';

final API_URL = Uri.parse('http://localhost:8000/api/');

void main() async {
  await http
      .get(API_URL)
      .then((res) {
        var result = jsonDecode(res.body); // list<dyamic>
        result.forEach((data) {
          Post post = new Post(
            userId: data['userId'],
            id: data['id'],
            title: data['title'],
            body: data['body'],
          );
          print("${post.userId} =>${post.id}=>${post.title}=>${post.body}");
        });
      })
      .catchError((e) => print(e));
}
