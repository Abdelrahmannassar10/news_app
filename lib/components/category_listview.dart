import 'package:flutter/material.dart';
import 'package:news_app_nassar/components/category_item.dart';
import 'package:news_app_nassar/models/category_model.dart';

class category_listview extends StatelessWidget {
  const category_listview({
    super.key,
  });
  final List<CategoryModel> category = const [
    CategoryModel(image: "assets/business.png", categoryName: "Business"),
    CategoryModel(image: "assets/sports.jpg", categoryName: "Sports"),
    CategoryModel(
        image: "assets/entertaiment.png", categoryName: "Entertainment"),
    CategoryModel(image: "assets/political.jpg", categoryName: "Politics"),
    CategoryModel(image: "assets/health.avif", categoryName: "Health"),
    CategoryModel(image: "assets/science.png", categoryName: "Science"),
    CategoryModel(image: "assets/technology.jpg", categoryName: "Technology"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            category: category[index],
          );
        },
      ),
    );
  }
}
