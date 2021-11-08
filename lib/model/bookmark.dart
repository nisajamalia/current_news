import 'package:flutter/cupertino.dart';
import 'package:news_app/model/articles.dart';

class BookmarkModel extends ChangeNotifier{
  List<Article> articles = [];

  //function untuk menambahkan & mengurangi bookmark
  void addToBookmark(Article article){
    articles.add(article);
    //untuk perubahan ui
    notifyListeners();
  }
  void removeFromBookmark(Article article){
    articles.remove(article);
    notifyListeners();
  }
}