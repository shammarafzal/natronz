import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

void main() {
  runApp(HomePage());
}


class HomePage extends StatelessWidget {
  final Completer <WebViewController> _controller = Completer<
      WebViewController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: WebView(
            initialUrl: 'https://natronz.com',
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            javascriptMode: JavascriptMode.unrestricted,
          ),
        )
    );
  }
}

