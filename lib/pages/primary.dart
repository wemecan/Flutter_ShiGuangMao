import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shiguangmao/utils/data_help.dart';
import 'package:flutter_shiguangmao/utils/toast_util.dart';
import 'package:provide/provide.dart';

import '../provide/current_index.dart';
import '../utils/string_utils.dart';
import 'find.dart';
import 'home.dart';
import 'me.dart';
import 'news.dart';

class PrimaryPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), title: Text(StringUtils.home)),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications), title: Text(StringUtils.news)),
    BottomNavigationBarItem(
        icon: Icon(Icons.find_in_page), title: Text(StringUtils.find)),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), title: Text(StringUtils.me))
  ];

  final List<Widget> tabPages = [HomePage(), NewsPage(), FindPage(), MePage()];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    DateTime _lastPressedAt; //上次点击时间
    return WillPopScope(onWillPop: () async {
      if (_lastPressedAt == null ||
          DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
        //两次点击间隔超过1秒则重新计时
        _lastPressedAt = DateTime.now();
        toast('再按一次退出应用');
        return false;
      }
      DataHelp().close();
      return true;
    }, child: Provide<CurrentIndexProvide>(builder: (context, child, val) {
      int currentIndex =
          Provide.value<CurrentIndexProvide>(context).currentIndex;
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: bottomTabs,
            onTap: (index) {
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            }),
        body: IndexedStack(index: currentIndex, children: tabPages),
      );
    }));
  }
}
