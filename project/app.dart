import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  late int userId, id;
  late String title, body;
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  factory Post.form(dynamic data) {
    return Post(
      userId: data['userId'],
      id: data['id'],
      title: data['title'],
      body: data['body'],
    );
  }
}

final Base_Url = Uri.parse('http://localhost:8000/api/');
void main() async {
  await http
      .get(Base_Url)
      .then((res) {
        // var results = jsonDecode(res.body);
        // results.forEach((data) {
        //   var val = new Post(
        //     userId: data['userId'],
        //     id: data['id'],
        //     title: data['title'],
        //     body: data['body'],
        //   );
        //   print(val.id);
        // });
        var results = jsonDecode(res.body) as List;
        List<Post> posts = results.map((e) => Post.form(e)).toList();
        posts.forEach((element) => print(element.id));
      })
      .catchError((e) => print(e));
}
