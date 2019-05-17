import 'package:flutter/material.dart';

import '../pages/home/banner_widget.dart';
import '../pages/home/feature_spot_widget.dart';
import '../pages/home/marquee_widget.dart';
import '../pages/home/recommend_widget.dart';
import '../pages/home/type_widget.dart';
import '../utils/color_utils.dart';
import '../utils/string_utils.dart';
import '../widget/divider.dart';
import 'home/feature_title_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //阴影高度
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(Icons.notifications_none, color: ColorUtils.red),
        title: Text(
          StringUtils.home,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: <Widget>[
          Center(
              child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text('临汾店', style: TextStyle(color: ColorUtils.red))))
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: false,
        slivers: <Widget>[
          SliverToBoxAdapter(child: BannerWidget()),
          TypeWidget(),
          SliverToBoxAdapter(child: DividerWidget(8)),
          SliverToBoxAdapter(child: MarqueWidget()),
          SliverToBoxAdapter(child: DividerWidget(8)),
          RecommendWidget(),
          SliverToBoxAdapter(child: DividerWidget(8)),
          SliverToBoxAdapter(child: FeatureTitleWidget()),
          FeatureSpotWidget(),
        ],
      ),
    );
  }
}