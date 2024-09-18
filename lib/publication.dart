import 'dart:convert';


class Publication {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
 
  Publication({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

    factory Publication.fromJson(Map<String, dynamic> publication) => Publication(
      author: publication['author'],
      title: publication['title'],
      description: publication['description'],
      url: publication['url'],
      urlToImage: publication['urlToImage'],
      publishedAt: publication['publishedAt'],
      content: publication['content'],
    );
}

List<Publication> parsePublications(String? json) {
  if (json == null) {
    return [];
  }


  final List parsed = jsonDecode(json);
  return parsed.map((json) => Publication.fromJson(json)).toList();
}

