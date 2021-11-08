import 'package:flutter/material.dart';
import 'package:news_app/utils/theme.dart';

class CategoryItem extends StatelessWidget {
  final String imgUrl , categoryName; 
  const CategoryItem({Key? key, required this.imgUrl, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imgUrl, height: 60, width: 120, fit: BoxFit.cover,),
          ),
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26
            ),
            child: Text(categoryName,
              textAlign: TextAlign.center,
              style: categoryTitle,
            ),
          )
        ],
        
      ),

    );
  }
}
