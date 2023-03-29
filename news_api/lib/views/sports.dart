import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';

import '../controller/newslistitem.dart';
import '../services/api_services.dart';

class Sports extends StatefulWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews("sports"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articleModel = snapshot.data ?? [];
            return ListView.builder(itemBuilder: (context, index) {
              return NewsListItem(
                newsModel: articleModel[index],
              );
            },itemCount: articleModel.length,);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}