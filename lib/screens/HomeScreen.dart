import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_news_hub/widgets/NewsTile.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = true;
  List<Map<String, dynamic>> articles = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=084c6f0cc3284f6888038303d26972e0'; // Replace with your NewsAPI key
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['status'] == 'ok') {
          jsonData['articles'].forEach((element) {
            if (element['urlToImage'] != null &&
                element['description'] != null &&
                element['content'] != null) {
              articles.add(element);
            }
          });
        }
      } else {
        print('Failed to load news');
      }
    } catch (e) {
      print('Error: $e');
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My News Hub")),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: getNews,
              child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return NewsTile(
                    articleUrl: articles[index]['url'],
                    title: articles[index]['title'],
                    description: articles[index]['description'],
                    imgUrl: articles[index]['urlToImage'] ??
                        "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg",
                    content: articles[index]['content'],
                  );
                },
              ),
            ),
    );
  }
}
