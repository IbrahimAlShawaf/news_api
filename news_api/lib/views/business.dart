import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';

import '../controller/newslistitem.dart';
import '../services/api_services.dart';

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business News"),
      ),
      body: FutureBuilder(
        future: apiService.getAllNews("business"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articleModel = snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsListItem(
                  newsModel: articleModel[index],
                );
              },
              itemCount: articleModel.length,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
