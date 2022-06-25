class Post {
  String author;
  int id;
  String title;
  String image;
  String slug;
  String body;
  DateTime created_at;
  DateTime updated_at;

  Post({
    required this.author,
    required this.id,
    required this.title,
    required this.image,
    required this.slug,
    required this.body,
    required this.created_at,
    required this.updated_at,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      author: json["author"],
      id: json["id"],
      title: json["title"],
      image: json["image"],
      slug: json["slug"],
      body: json["body"],
      created_at: DateTime.parse(json["created_at"]),
      updated_at: DateTime.parse(json["updated_at"]),
    );
  }
}
