import 'package:flutter/material.dart';

class NavigatorProvider {
  final GlobalKey<NavigatorState> _navigatorKey = new GlobalKey<NavigatorState>(debugLabel: 'Rex');

  static final NavigatorProvider _instance = NavigatorProvider._();

  NavigatorProvider._();

  /// 赋值给根布局的 materialApp 上
  /// navigatorKey.currentState.pushName('url') 可直接用于跳转
  static GlobalKey<NavigatorState> get navigatorKey => _instance._navigatorKey;

  /// 可用于 跳转，overlay-insert（toast，loading） 使用
  static BuildContext? get navigatorContext => _instance._navigatorKey.currentState?.context;
}