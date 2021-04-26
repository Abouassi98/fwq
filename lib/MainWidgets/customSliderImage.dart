import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CustomSliderImage extends StatelessWidget {
  final List list = [
    "https://picsum.photos/250?image=9",
  ];

  @override
  Widget build(BuildContext context) {
    return Carousel(
      boxFit: BoxFit.fill,
      images: List.generate(list.length, (int index) {
        return CachedNetworkImage(
            imageUrl: list[index],
            fadeInDuration: Duration(seconds: 2),
            placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/1.png'),
                        fit: BoxFit.cover),
                  ),
                ),
            imageBuilder: (context, provider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: provider, fit: BoxFit.fill),
                ),
              );
            });
      }),
      autoplay: false,
      dotIncreasedColor: Theme.of(context).primaryColor,
      dotIncreaseSize: 2,
      dotSize: 5,
      dotSpacing: 20,
      autoplayDuration: Duration(seconds: 1),
      dotBgColor: Color(0x00000000),
      animationCurve: Curves.decelerate,
      animationDuration: Duration(milliseconds: 1000),
      indicatorBgPadding: 10,
      dotColor: Colors.white,
      dotVerticalPadding: 10,
    );
  }
}
