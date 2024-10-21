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

  // List of news categories
  List<String> categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];

  // Track the selected category
  String selectedCategory = 'general'; // Default category

  Future<void> getNews() async {
    setState(() {
      loading = true; // Show loading indicator while fetching data
    });

    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=$selectedCategory&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=084c6f0cc3284f6888038303d26972e0'; // Replace with your API key

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['status'] == 'ok') {
          articles.clear(); // Clear previous articles before fetching new ones
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
    getNews(); // Fetch news on app start
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My News Hub",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xFF424242),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // Category Selector (Horizontal ListView)
          Container(
            height: 50,
            // margin: EdgeInsets.symmetric(vertical: 10),
            // margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color(0xFF424242), // Set background color here
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory =
                          categories[index]; // Update selected category
                    });
                    getNews(); // Fetch news for the selected category
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: selectedCategory == categories[index]
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        categories[index].toUpperCase(),
                        style: TextStyle(
                          color: selectedCategory == categories[index]
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // News Content Section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF424242), Color(0xFF424242)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: loading
                  ? Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: getNews,
                      child: ListView.builder(
                        itemCount: articles.length,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
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
            ),
          ),
        ],
      ),
    );
  }
}
