import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_api/model/news_model.dart';

class ApiService {
  Future<List<NewsModel>> getAllNews(String cat) async {
    final url = "https://newsapi.org/v2/top-headlines?country=eg&category=${cat}&apiKey=cd0150648ef64250817f4e7b6d1df1fc";
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articles =
            body.map((dynamic item) => NewsModel.fromJson(item)).toList();
        return articles;
      } else {
        throw ("No article found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
