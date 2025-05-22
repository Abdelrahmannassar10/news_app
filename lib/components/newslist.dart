import 'package:flutter/material.dart';
import 'package:news_app_nassar/components/news_tiles.dart';
import 'package:news_app_nassar/models/atricle_model.dart';

class Newslist extends StatelessWidget {
  final List<AtricleModel> article;
  const Newslist({
    super.key,required this.article
  });
  @override
  Widget build(BuildContext context) {
    return  SliverList(
                delegate: SliverChildBuilderDelegate(childCount: article.length,
                    (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: NewsTile(
                    articleModel: article[index],
                  ),
                );
              }));
            
  }
}
