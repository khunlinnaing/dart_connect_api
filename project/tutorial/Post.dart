class Post {
  late int userId, id; // late is safely for nullable
  late String title, body;
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  }); // constructor

  factory Post.from(dynamic data) {
    return Post(
      userId: data['userId'],
      id: data['id'],
      title: data['title'],
      body: data['body'],
    );
  }
}
