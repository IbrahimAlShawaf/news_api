import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';

import '../controller/newslistitem.dart';
import '../services/api_services.dart';

class Science extends StatefulWidget {
  const Science({Key? key}) : super(key: key);

  @override
  State<Science> createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews("science"),
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