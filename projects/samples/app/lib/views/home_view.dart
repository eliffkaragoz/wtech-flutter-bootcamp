import 'package:app/widgets/customWidgets/bottom_app_bar.dart';
import 'package:app/widgets/customWidgets/custom_appbar.dart';
import 'package:app/widgets/customWidgets/floating_action_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isAppBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppBar(),
      appBar: isAppBar ? _appBar() : const CustomAppBar(),
      // Floating Action ksımındaki ovallik body'nin yerini aldı
      extendBody: true,
      // Arkada kalan ovallik body ile aynı rengi aldı
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const BottomAppBarWidget(),
      //floatingActionButton: CustomWidgets.getFloatingActionButton(),
      floatingActionButton: FloatingActionButtonWidget(
        changeAppBar: (appBar) {
          setState(() {
            isAppBar = appBar;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(color: Colors.orange.shade200),
    );
  }

  AppBar _appBar() {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      leading: const Icon(Icons.menu),
      title: const Text('Page title'),
      actions: const [
        Icon(Icons.favorite),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.search),
        ),
        Icon(Icons.more_vert),
      ],
    );
  }
}
