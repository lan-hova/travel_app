import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/helpers/assets_helper.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildItemCategory(Widget icon, Color color, Function() onTap, String title){
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: kMediumPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kItemPadding),
              color: color.withOpacity(0.2)
            ),
            child: icon,
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Text(title)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      // titleString: 'Home',
      // implementLeading: true,
      // implementTrailing: true,

      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hi Jame !',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text('How do you feel to day?', style: TextStyle(fontSize: 12),)
              ],
            ),
            Spacer(),
            Icon(FontAwesomeIcons.bell, size: kDefaultIconSize,),
            SizedBox(width: kTopPadding,),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kItemPadding),
                color: Colors.white
              ),
              padding: EdgeInsets.only(left: kMinPadding, right: kMinPadding, top: kMinPadding),
              child: Image.asset(AssetsHelper.person,)
            )

          ],
        ),
      ),
      child: Column(
          children: [
            TextField(
              // showCursor: false,
              enabled: false,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'What is your favorite destination ?',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(kTopPadding),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                    size: kDefaultIconSize,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(kItemPadding)

                ),
                contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: [
                Expanded(
                  child: _buildItemCategory(
                  Image.asset(AssetsHelper.icoHotel,
                  width: kBottomBarIconSize,
                  height: kBottomBarIconSize,
                  ),
                  Colors.pinkAccent,
                  () {},
                  'Hotels'),
                ),
                SizedBox(width: kDefaultPadding,),
                Expanded(
                  child: _buildItemCategory(
                  Image.asset(AssetsHelper.icoPlane,                  
                  width: kBottomBarIconSize,
                  height: kBottomBarIconSize,
                  ),
                  Colors.blueAccent,
                  () {},
                  'Flights'),
                ),
                SizedBox(width: kDefaultPadding,),
                Expanded(
                  child: _buildItemCategory(
                  Image.asset(AssetsHelper.icoHotelPlane,
                  width: kBottomBarIconSize,
                  height: kBottomBarIconSize,
                  ),
                  Colors.yellowAccent,
                  () {},
                  'All'),
                )
              ],
            )

          ],
        ),
    );
  }
}
