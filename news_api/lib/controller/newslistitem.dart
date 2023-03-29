import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';

import '../views/news_detail.dart';

class NewsListItem extends StatelessWidget {
  final NewsModel newsModel;

  const NewsListItem({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(
                      newsModel: newsModel,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CachedNetworkImage(
            //   fit: BoxFit.fitWidth,
            //   width: double.infinity,
            //   height: 250,
            //   imageUrl:newsModel.urlToImage.toString(),
            //   placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            //   errorWidget: (context, url, error) => const Icon(Icons.error),
            // ),
            Image.network(
              newsModel.urlToImage ??
                  "https://www.hessequa.gov.za/wp-content/uploads/2021/03/Marketplace-Lending-News.jpg"
                      .toString(),
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 250,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff622ca7),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    newsModel.source!.name.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  newsModel.publishedAt.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              "Written by   ${newsModel.author}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              newsModel.title.toString(),
              style: const TextStyle(fontSize: 14),
              textDirection: TextDirection.rtl,
            )
          ],
        ),
      ),
    );
  }
}
