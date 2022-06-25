class Comment {
  int id;
  String name;
  String title;
  String comment;
  DateTime created_at;

  Comment({
    required this.id,
    required this.name,
    required this.title,
    required this.comment,
    required this.created_at,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json["id"],
      name: json["name"],
      title: json["title"],
      comment: json["comment"],
      created_at: DateTime.parse(json["created_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title,
        "comment": comment,
        "created_at": created_at.toIso8601String(),
      };
}
