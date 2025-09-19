import 'package:dio/dio.dart';
import 'package:news_app_nassar/models/atricle_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);
  Future<List<AtricleModel>> Getgeneralnews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsdata.io/api/1/latest?apikey=pub_77164050251f3331fb545eeae9c30c88c155c&country=eg&category=$category');
      Map<String, dynamic> JsonData = response.data;
      List<dynamic> articlels = JsonData["results"];
      List<AtricleModel> articleslist = [];
      for (var article in articlels) {
        AtricleModel atricleModel = AtricleModel.fromJson(article);
        articleslist.add(atricleModel);
      }
      return articleslist;
    } catch (e) {
      return [];
    }
  }
}
