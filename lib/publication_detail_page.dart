import 'package:flutter/material.dart';
import 'package:kepo_app/publication.dart';
import 'package:kepo_app/publication_web_view.dart';


class PublicationDetailPage extends StatelessWidget {
  static const routeName = '/publication_detail';


  final Publication publication;


  const PublicationDetailPage({Key? key, required this.publication})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(publication.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(publication.urlToImage),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(publication.description),
                  const Divider(color: Colors.grey),
                  Text(
                    publication.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Text('Tanggal: ${publication.publishedAt}'),
                  const SizedBox(height: 10),
                  Text('Penulis: ${publication.author}'),
                  const Divider(color: Colors.grey),
                  Text(
                    publication.content,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Selengkapnya'),
                    onPressed: () {
                      Navigator.pushNamed(context, PublicationWebView.routeName,
                          arguments: publication.url);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
