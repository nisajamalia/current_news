import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/model/articles.dart';

//repository jembatan antara ui dan data
// buat variable untuk base url dan api key

String apiKey = 'c1fb75046145488e858b2e8e8b3a4ed8';
String baseUrl = 'https://newsapi.org/v2';

class News{
  // Future - Asyncronus
  Future<List<Article>?> getNews() async {
    List<Article>? list ;
    String url = '$baseUrl/top-headlines?country=id&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      //kalau dia success
      var data = jsonDecode(response.body);
          var result = data['articles'] as List;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
    }
    return list;

  }
}
class RequestByCategory{
  Future<List<Article>?> getNewsByCategory(String category) async{
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&category=$category&apiKey=$apiKey';
    //async pasti akan berdampingan dengan await
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      print(response.body);
      var result = data['articles'] as List;
      list = result.map<Article>((json)=>Article.fromJson(json)).toList();

    }
    return list;
  }
}