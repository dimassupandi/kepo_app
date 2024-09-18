import 'package:flutter/material.dart';
import 'package:kepo_app/publication.dart';
import 'package:kepo_app/publication_detail_page.dart';


class HeadlineListPage extends StatelessWidget {
  static const routeName = '/publication_list';


  const HeadlineListPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kepo App'),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/data/data.json'),
        builder: (context, snapshot) {
          final List<Publication> publications =
              parsePublications(snapshot.data);
          return ListView.builder(
            itemCount: publications.length,
            itemBuilder: (context, index) {
              return _buildPublicationItem(context, publications[index]);
            },
          );
        },
      ),
    );
  }
   Widget _buildPublicationItem(BuildContext context, Publication publication) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      leading: Image.network(
        publication.urlToImage,
        width: 100,
      ),
      title: Text(publication.title),
      subtitle: Text(publication.author),
      onTap: () {
        Navigator.pushNamed(context, PublicationDetailPage.routeName,
            arguments: publication);
      },
    );
  }
}
