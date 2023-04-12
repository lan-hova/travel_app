import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/constants/textstyle_ext.dart';
import 'package:travel_app/helpers/assets_helper.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/widgets/item_button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static String routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(
      String image, String title, String description, Alignment alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: alignment,
          child: Image.asset(
            image,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyles.defaultStyle.bold.copyWith(fontSize: 24)),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(
                  AssetsHelper.slide1,
                  'Find a hotel room',
                  'Select the day, book your room. We give you the best price.',
                  Alignment.centerRight),
              _buildItemIntroScreen(
                  AssetsHelper.slide2,
                  'Enjoy your trip',
                  'Easy discovering new places and share these between your friends and travel together.',
                  Alignment.center),
              _buildItemIntroScreen(
                  AssetsHelper.slide3,
                  'Book a flight',
                  'Found a flight that matches your destination and schedule? Book it instantly.',
                  Alignment.centerLeft)
            ],
          ),
          Positioned(
              left: kMediumPadding,
              right: kMediumPadding,
              bottom: kMediumPadding,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        dotWidth: kMinPadding,
                        dotHeight: kMinPadding,
                        activeDotColor: Colors.orange,
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        if (_pageController.page == 2) {
                          Navigator.of(context).pushNamed(MainApp.routeName);
                        } else {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(kMediumPadding),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: kMediumPadding * 2,
                            vertical: kDefaultPadding),
                        child: StreamBuilder<int>(
                          initialData: 0,
                          stream: _streamController.stream,
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data != 2 ? 'Next' : 'Get Started',
                              style:
                                  TextStyles.defaultStyle.whiteTextColor.bold,
                            );
                          },
                        ),
                      )
                    )
                ],
              ))
        ],
      ),
    );
  }
}
