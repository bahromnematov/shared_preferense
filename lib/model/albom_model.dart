
class Albom {
  int userId;
  int id;
  String title;

  Albom({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Albom.fromJson(Map<String, dynamic> json) => Albom(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
