
import 'dart:convert';

import 'package:news_app/model/source.dart';

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"] ?? "null",
    title: json["title"] == null ? null : json["title"] ?? "null",
    description: json["description"] ?? "null",
    url: json["url"] ?? "null",
    urlToImage: json["urlToImage"] ?? "https://www.btklsby.go.id/images/placeholder/basic.png",
    publishedAt: json["publishedAt"] ?? "null",
    content: json["content"] ?? "null",
  );

}

