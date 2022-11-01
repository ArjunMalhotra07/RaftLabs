import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class WebViewWidget extends StatefulWidget {
//   WebViewWidget({Key? key}) : super(key: key);

//   @override
//   State<WebViewWidget> createState() => _WebViewWidgetState();
// }

// class _WebViewWidgetState extends State<WebViewWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter WebView example'),
//       ),
//       body: const WebView(
//         initialUrl: 'https://flutter.io',
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }

// class WebViewWidget1 extends StatefulWidget {
//   WebViewWidget1({Key? key}) : super(key: key);

//   @override
//   State<WebViewWidget1> createState() => _WebViewWidget1State();
// }

// class _WebViewWidget1State extends State<WebViewWidget1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(''),
//       ),
//       body: SizedBox(
//         width: MediaQuery.of(context)
//             .size
//             .width, // it uses all the width of screen, you can change it
//         height: MediaQuery.of(context)
//             .size
//             .height, // it uses all the height of screen, you can change it
//         child: WebView(
//           initialUrl: "https://github.com/ArjunMalhotra07",
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       ),
//     );
//   }
// }
