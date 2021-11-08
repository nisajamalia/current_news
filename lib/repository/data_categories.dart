import 'package:news_app/model/category.dart';

List<Category> getCategories() {
  List<Category> categories = [
    Category(
      categoryName: 'Business',
      imgUrl: 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'),
    Category(
      categoryName: 'entertainment',
      imgUrl: 'https://media.istockphoto.com/photos/media-concept-smart-tv-picture-id610408004?s=612x612'),
Category(
      categoryName: 'general',
      imgUrl: 'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'),
Category(
      categoryName: 'health',
      imgUrl: 'https://media.istockphoto.com/photos/medical-technology-background-picture-id1255646957?s=612x612'),
Category(
    categoryName: 'science',
    imgUrl: 'https://media.istockphoto.com/photos/high-school-girl-looking-through-microscope-at-school-picture-id1278973856?s=612x612'),
Category(
    categoryName: 'sports',
    imgUrl: 'https://media.istockphoto.com/photos/various-sport-equipments-on-grass-picture-id949190736?s=612x612'),
    Category(
    categoryName: 'technology',
    imgUrl: 'https://media.istockphoto.com/photos/analyst-working-with-business-analytics-and-data-management-system-on-picture-id1286642964?s=612x612'),

  ];

    return categories;
}