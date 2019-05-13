import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shiguangmao/pages/setting/setting.dart';
import 'package:flutter_shiguangmao/pages/user/login_page.dart';

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});
Handler settingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingPage();
});
