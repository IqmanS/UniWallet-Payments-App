import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class News {
  final String id;
  final source;
  final author;
  final title;
  final description;
  final url;
  final urlToImage;
  final publishedAt;
  final content;

  News(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
      required this.id});
}

class FinLit with ChangeNotifier {
  List<News> newsList = [];

  List<News> get news {
    return [...newsList];
  }

  Future<void> fetchAndSetNews() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=1b93f4478dc54371a5a87be58dc8207c");
    if (newsList.length < 10) {
      final res = await http.get(url);

      final Map<String, dynamic> fetchedNews = json.decode(res.body);
      final List<dynamic> fetchedArticles = fetchedNews["articles"];
      if (newsList.length < 10) {
        fetchedArticles.forEach(
          (element) {
            final article = element as Map<String, dynamic>;
            final News fetched = News(
              author: article['author'],
              id: DateTime.now().toString(),
              content: article['content'],
              description: article['description'],
              publishedAt: article['publishedAt'],
              source: article['source'],
              title: article['title'],
              url: article['url'],
              urlToImage: article['urlToImage'],
            );
            newsList.add(fetched);
          },
        );
      }
      print(newsList);
      notifyListeners();
    }
  }
}
