import 'package:flutter/material.dart';
import 'package:news_app/model/articles.dart';
import 'package:news_app/repository/data_service.dart';
import 'package:news_app/utils/theme.dart';
import 'package:news_app/widgets/news_item.dart';

class NewsPageCategory extends StatefulWidget {
  final String categoryName;

  const NewsPageCategory({Key? key, required this.categoryName}) : super(key: key);

  @override
  _NewsPageCategoryState createState() => _NewsPageCategoryState();
}

class _NewsPageCategoryState extends State<NewsPageCategory> {
  final RequestByCategory requestByCategory = RequestByCategory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: requestByCategory.getNewsByCategory(widget.categoryName),
        builder: (context, snapshot){
          return snapshot.data !=null ? _listNewsCategory(snapshot.data as List<Article>)
              :Center(child: CircularProgressIndicator(),);
        }),

    );
  }
  Widget _listNewsCategory(List<Article> articles){
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16,),
          Container(
            margin: EdgeInsets.only(left: 30),
            alignment: Alignment.topLeft,
            child: Text(widget.categoryName + "News", style: titleHome,),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),

            child: ListView.builder(
              itemCount: articles.length,
                itemBuilder: (context, index){
              return NewsItem(article: articles[index]);
            }),
          )
        ],
      ),
    ));
  }
}
