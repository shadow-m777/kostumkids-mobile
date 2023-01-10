import 'dart:io';
import 'dart:async';
import '../helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/main_provider.dart';
import '../widgets/activity_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Scaffold(
      backgroundColor: ColorsConst.white,
      body: SafeArea(
        child: MainBodyWidget(
          index: mainProvider.index,
          pageFinish: (_) => mainProvider.changeState(),
          controller: _controller,
        ),
      ),
    );
  }
}

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({
    Key? key,
    required this.index,
    required this.pageFinish,
    required this.controller,
  }) : super(key: key);

  final int index;
  final Function(String) pageFinish;
  final Completer<WebViewController> controller;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: WebView(
                initialUrl: APIConst.mainURL,
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: pageFinish,
                onWebViewCreated: (webViewController) =>
                    controller.complete(webViewController),
              ),
            ),
          ],
        ),
        const ActivityIndicatorWidget(),
      ],
    );
  }
}
