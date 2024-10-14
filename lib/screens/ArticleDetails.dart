import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetail extends StatelessWidget {
  final String title;
  final String description;
  final String imgUrl;
  final String articleUrl;
  final String content;

  ArticleDetail(
      {required this.title,
      required this.description,
      required this.imgUrl,
      required this.articleUrl,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A detailed view of the article",
          style: TextStyle(
            color: Colors.white, // Change font color to white
            fontWeight: FontWeight.bold, // Optional: Make it bold
            fontSize: 22, // Optional: Adjust the font size
          ),
        ),
        backgroundColor: Color(0xFF424242), // Set the background color
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          children: [
            Text(
              this.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                this.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              this.description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              this.content,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                final Uri uri = Uri.parse(articleUrl);
                if (!await launchUrl(uri)) {
                  throw 'Could not launch $articleUrl';
                }
              },
              child: Text("Read full article"),
            ),
          ],
        ),
      ),
    );
  }
}
