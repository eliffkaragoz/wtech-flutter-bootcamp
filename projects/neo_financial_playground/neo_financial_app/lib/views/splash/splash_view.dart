//This class is not best practice for splash screen, but it works.
import 'package:flutter/material.dart';
import 'package:neo_financial_app/views/home/home_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final String splashTitle = 'neo';
  final String splashImageUrl = 'assets/images/people-splash.png';

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            direction: Axis.vertical,
            spacing: MediaQuery.of(context).size.height / 6,
            children: [
              Text(splashTitle,
                  style: Theme.of(context).textTheme.displayLarge),
              Image(
                  width: MediaQuery.of(context).size.width.toDouble(),
                  fit: BoxFit.fill,
                  image: AssetImage(splashImageUrl))
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeView()));
    //TODO: Here must be in routes folder
  }
}
