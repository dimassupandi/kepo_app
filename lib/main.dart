import 'package:flutter/material.dart';
import 'package:kepo_app/publication.dart';
import 'package:kepo_app/publication_detail_page.dart';
import 'package:kepo_app/publication_web_view.dart';
import 'headline_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kepo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HeadlineListPage.routeName,
      routes: {
        HeadlineListPage.routeName: (context) => const HeadlineListPage(),
        PublicationDetailPage.routeName: (context) => PublicationDetailPage(
            publication:
                ModalRoute.of(context)?.settings.arguments as Publication),
        PublicationWebView.routeName: (context) => PublicationWebView(
              url: ModalRoute.of(context)?.settings.arguments as String,
            )
      },
    );
  }
}
