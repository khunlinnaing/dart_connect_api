import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Post.dart';

final API_URL = Uri.parse('http://localhost:8000/api/');

void main() async {
  await http
      .get(API_URL)
      .then((res) {
        var result = jsonDecode(res.body) as List; // list<dyamic>
        List<Post> posts = result.map((data) => Post.from(data)).toList();

        posts.forEach((post) => print(post.id));
      })
      .catchError((e) => print(e));
}
