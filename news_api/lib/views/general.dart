import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';

import '../controller/newslistitem.dart';
import '../services/api_services.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General News"),
      ),
      body: FutureBuilder(
        future: apiService.getAllNews("general"),
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
