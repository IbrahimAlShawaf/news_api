import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';

import '../controller/newslistitem.dart';
import '../services/api_services.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews("health"),
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