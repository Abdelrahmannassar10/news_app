import 'package:flutter/material.dart';
import 'package:news_app_nassar/components/news_listview_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.category} News',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          NewsListviewBuilder(
            category: category,
          )
        ],
      ),
    );
  }
}
