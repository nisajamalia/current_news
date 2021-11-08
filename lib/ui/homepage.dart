import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/articles.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/repository/data_categories.dart';
import 'package:news_app/repository/data_service.dart';
import 'package:news_app/utils/theme.dart';

import 'bookmark_page.dart';
import 'news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //buat variable untuk index halaman bottom nav
  int _currentIndex = 0;

  //buat variable untuk controller page
  late PageController _pageController;

  //memanggil model data dan data categories
  News news = News();
  late List<Category> categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //future manggil data nya cepet soalnya dia pake asyncrhonush
        //harus gunain futuer builder buat manggil data
        child: FutureBuilder(
            future: news.getNews(),
            builder: (context, snapshot) {
              // kalau ada data nya dia akan nampilin page view
              return snapshot.data != null ?
              //kyk vie pager
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                //ngedaftarin halaman page nya
                children: [
                  NewsPage(snapshot.data as List<Article>, categories),
                  BookMarkPage()
                ],
              )
              //kalau gaada dia akan loading
                  : Center(
                child: CircularProgressIndicator(),
              );
            }
        ),

      ),
      //buat bottom nav
      //untuk melengkungkan widget (kyk radius)
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: MediaQuery.of(context).size.width - (2*60),
          color: Color(0xffF6f7f8),
          child: BottomNavyBar(
            //ketika bottomnya di klik
            selectedIndex: _currentIndex,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                  icon: Icon(
                    Icons.article_outlined,
                    size: 24),
                    title: Text('News',
                    style: detailArticle.copyWith(
                      fontSize: 16,
                      color: Colors.blue
                    ),)
              ),
              BottomNavyBarItem(
                  icon: Icon(
                    Icons.bookmark_border,
                    size: 24),
                    title: Text('BookMark',
                    style: detailArticle.copyWith(
                      fontSize: 16,
                      //ketika bottom di klik warna biru
                      color: Colors.blue
                    ),)
              ),

            ],
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.jumpToPage(index);
              });
            },

          ),
        ),
      ),
      //centerfloat ke tengah dan mengapung
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
