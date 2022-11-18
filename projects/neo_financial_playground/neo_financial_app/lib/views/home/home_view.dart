import 'package:flutter/material.dart';
import 'package:neo_financial_app/widgets/custom_bottom_navigation_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
          body: Center(
            child: Text('Neo Financial'),
          ),
          bottomNavigationBar: CustomBottomNavBar(),
        ));
  }
}