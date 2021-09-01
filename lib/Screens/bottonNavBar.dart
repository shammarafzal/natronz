import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final Completer <WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: Scaffold(
        // appBar: new AppBar(
        //   elevation: 0.0,
        //   centerTitle: true,
        //   backgroundColor: Colors.blue,
        //   title: Text(DemoLocalization.of(context)
        //       .getTranslatedValue('privacy_policy')),
        // ),
        body: WebView(
          initialUrl: 'https://natronz.com',
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
