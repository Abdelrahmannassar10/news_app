import 'package:flutter/material.dart';
import 'package:news_app_nassar/models/category_model.dart';
import 'package:news_app_nassar/views/category_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                category: category.categoryName ,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(this.category.image)),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              this.category.categoryName,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
