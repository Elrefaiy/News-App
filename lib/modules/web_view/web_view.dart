import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatelessWidget {
  final String url;
  final String title;
  WebScreen(this.url, this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        titleSpacing: 0,
      ),
      body: WebView(
        initialUrl: url ,
      ),
    );
  }
}
