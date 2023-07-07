
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../tools/navigator_provider.dart';
import 'base_web_auth.dart';

BaseWebAuth createWebAuth() => WebviewAuth();

class WebviewAuth implements BaseWebAuth {
  @override
  Future<String> authenticate(
      {required String callbackUrlScheme,
        required String url,
        required String redirectUrl,
        Map<String, dynamic>? opts}) async {

    return await NavigatorProvider.navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => LoginWebView()));
  }
}

class LoginWebView extends StatefulWidget {
  const LoginWebView({super.key});

  @override
  State<LoginWebView> createState() => _LoginWebViewState();
}

class _LoginWebViewState extends State<LoginWebView> {

  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://user.config.vip/login/oauth/authorize?client_id=4f1a510eea20d930dec7&response_type=code&redirect_uri=casdoor://success&scope=read&state=casdoor"))
      ..setNavigationDelegate(
          NavigationDelegate(
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith("casdoor://success")) {
                  Navigator.pop(context, request.url);
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              }
          )
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WebViewWidget(controller: controller,),);
  }
}