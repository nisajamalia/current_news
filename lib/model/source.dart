
class Source {
  Source({
     this.id,
     this.name,
  });
//berikan nullable karena datanya ada yang null
  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] ,
    name: json["name"],
  );

}