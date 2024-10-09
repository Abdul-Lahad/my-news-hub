import 'package:flutter/material.dart';
import 'package:my_news_hub/screens/ArticleDetails.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String description;
  final String imgUrl;
  final String articleUrl;
  final String content;
  NewsTile(
      {required this.title,
      required this.description,
      required this.imgUrl,
      required this.articleUrl,
      required this.content});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imgUrl,
              width: 50,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetail(
                  title: this.title,
                  description: this.description,
                  imgUrl: this.imgUrl,
                  articleUrl: this.articleUrl,
                  content: this.content,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
