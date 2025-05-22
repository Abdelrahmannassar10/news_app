import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_nassar/components/newslist.dart';
import 'package:news_app_nassar/models/atricle_model.dart';
import 'package:news_app_nassar/services/news_service.dart';

class NewsListviewBuilder extends StatelessWidget {

  const NewsListviewBuilder({super.key , required this.category});
    final String category;
  Widget build(BuildContext context) {
    return FutureBuilder<List<AtricleModel>>(
        future: NewsService(Dio()).Getgeneralnews(category: category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Newslist(article: snapshot.data ?? []);
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Text("OOPs there was an error ,try again"),
            );
          } else {
            return SliverToBoxAdapter(
                child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()));
          }
        });
  }
}
