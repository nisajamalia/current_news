import 'package:flutter/material.dart';
import 'package:news_app/model/articles.dart';
import 'package:news_app/ui/detail_page.dart';
import 'package:news_app/utils/theme.dart';

class NewsHeadLine extends StatelessWidget {
  //membuat variable untuk menampung data dari model
  final Article article;
  NewsHeadLine({ required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          // article kiri = parameter dari detailPage
            // article kanan = variable dari newsheadline ini yang extends dari model
          builder: (context)=> DetailPage(article: article,)));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(article.urlToImage)
                )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.1, 0.9],
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.white.withOpacity(0.1),
                  ]
                )
              ),
            ),
            Positioned(
              bottom: 30,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(article.title, style: titleArticlehorizontal.copyWith(
                        fontSize: 12.0
                      ),
                      ),
                      Text(article.author, style: authorDateArticle.copyWith(
                        fontSize: 10
                      ),)
                    ],
                  ),
                ))

          ],
        ),
      ),

    );
  }
}
