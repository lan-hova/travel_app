import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travel_app/helpers/assets_helper.dart';
import 'package:travel_app/helpers/local_storage_helper.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async{
    final ignoreIntro = LocalStorageHelper.getValue('ignoreIntro') as bool?;
    await Future.delayed(const Duration(seconds: 3));
    if (ignoreIntro != null && ignoreIntro){
      Navigator.of(context).pushNamed(MainApp.routeName);
    } else {
      LocalStorageHelper.setValue('ignoreIntro', true);
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          AssetsHelper.backgroundSplash,
          fit: BoxFit.fitWidth,
        )),
        Positioned.fill(
            child: Image.asset(
          AssetsHelper.circleSplash,
          fit: BoxFit.fitWidth,
        )),
      ],
    );
    
  }
}
