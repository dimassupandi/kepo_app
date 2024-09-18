import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
 
class PublicationWebView extends StatelessWidget {
  static const routeName = '/article_web';
 
  final String url;
 
  const PublicationWebView({Key? key, required this.url}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kepo App'),
      ),
      body: WebViewWidget(
        controller: controller,
     ),
    );
  }
}
