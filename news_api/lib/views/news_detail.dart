import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;

  const NewsDetails({Key? key, required this.newsModel}) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.newsModel.title.toString(),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CachedNetworkImage(

            //   fit: BoxFit.fitWidth,
            //   width: double.infinity,
            //   height: 250,
            //   imageUrl: widget.newsModel.urlToImage.toString(),
            //   placeholder: (context, url) =>
            //       const Center(child: CircularProgressIndicator()),
            //   errorWidget: (context, url, error) => const Icon(Icons.error),
            // ),
            widget.newsModel.urlToImage != ""
                ? Image.network(
                    widget.newsModel.urlToImage ??
                        "https://www.hessequa.gov.za/wp-content/uploads/2021/03/Marketplace-Lending-News.jpg"
                            .toString(),
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: 250,
                  )
                : const Text("Cant Load Image"),
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
                    widget.newsModel.source!.name.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  widget.newsModel.publishedAt.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              "Written by  ${widget.newsModel.author}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 8.0,
            ),
            Text(
              widget.newsModel.description.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),

            const SizedBox(
              height: 8.0,
            ),

            Text(
              widget.newsModel.content.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    final Uri _url = Uri.parse(widget.newsModel.url.toString());
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
                  },
                  child: const Text("Read More...")),
            )
          ],
        ),
      ),
    );
  }
}
