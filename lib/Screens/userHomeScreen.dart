import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/provider/checkProvider.dart';
import 'package:graduation_project/Screens/shopItem.dart';
import 'package:graduation_project/provider/shopsProvider.dart';
import 'package:graduation_project/screen.dart';
import 'package:provider/provider.dart';
import '../MainWidgets/customScrollPhysics.dart';
import '../MainWidgets/customSliderImage.dart';
import '../MainWidgets/departmentFilter.dart';

class UserHomeScreen extends StatefulWidget {
  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  Widget shopDetails;
  String item;
  bool isInit = true;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      await Provider.of<ShopsProvider>(context, listen: false)
          .getShops(0, null, context);
      Provider.of<CheckProvider>(context, listen: false).assignValueShops(
          shops: Provider.of<ShopsProvider>(context, listen: false).shops);
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: [
          Container(
            height: 250,
            color: Colors.blue,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // CustomSliderImage(),

                // CustomSearchBar(),
              ],
            ),
          ),
          DepartmentFilter(),
          // Shop List or ShopDetail
          Directionality(
            textDirection: TextDirection.rtl,
            child: Consumer<CheckProvider>(builder: (context, ch, _) {
              return ch.shopsFilter.length == 0
                  ? Center(child: Text('لا يوجد مرضي'))
                  : ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      physics: CustomScrollPhysics(),
                      itemCount: ch.shopsFilter.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          delay: Duration(milliseconds: 400),
                          child: SlideAnimation(
                            duration: Duration(milliseconds: 400),
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: ShopItem(
                                image: ch.shopsFilter[index].photo,
                                shopName: ch.shopsFilter[index].name,
                                distance: "0",
                                productQuantity: 15.toString(),
                                view: 100.toString(),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Screen()));
                                },
                              ),
                            ),
                          ),
                        );
                      });
            }),
          ),
        ],
      ),
    );
  }
}
