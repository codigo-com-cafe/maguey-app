import 'package:flutter/material.dart';
import 'package:magueyapp/presentation/home/ui/screen/item_list_widget.dart';
import 'package:magueyapp/presentation/home/ui/widget/category_list_widget.dart';
import 'package:magueyapp/presentation/home/ui/widget/home_carousel.dart';
import 'package:magueyapp/presentation/widgets/custom_app_bar.dart';
import 'package:magueyapp/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:magueyapp/service/custom_bottom_navigation_bar_service.dart';
import 'package:magueyapp/theme/my_colors.dart';

class MyHomePage extends StatefulWidget {
  static const String route = 'home-screen';

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loader = false;
  final navbarService = CustomBottomNavigationBarService.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: MyColors.black2B2B2B,
      body: ValueListenableBuilder(
        valueListenable: navbarService.currentIndexNotifier,
        builder: (context, currentIndex, child) {
          return buildCurrentScreen(currentIndex);
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget buildCurrentScreen(final int index) {
    switch (index) {
      default:
        return SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Text(
                            'Bienvenidos to a',
                            style: TextStyle(
                              color: Color(0xFFEDE6D8),
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              height: 45 / 40,
                              fontFamily: 'CircularAirPro',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                'brand',
                                style: TextStyle(
                                  color: Color(0xFFEDE6D8),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  height: 45 / 40,
                                  fontFamily: 'Ogg',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                ' new day.',
                                style: TextStyle(
                                  color: Color(0xFFEDE6D8),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                  height: 45 / 40,
                                  fontFamily: 'CircularAirPro',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          HomeCarousel(), //Carrosel
                          SizedBox(height: 30),
                          Text(
                            'Search for the latest in Mezcal and Agave Spirits.',
                            style: TextStyle(
                              color: Color(0xFFE2D7C1),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 24 / 20,
                              fontFamily: 'CircularAirPro',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Explore bars, restaurants and retailers near you.',
                            style: TextStyle(
                              color: Color(0xFFE2D7C1),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 24 / 20,
                              fontFamily: 'CircularAirPro',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                    ItemListWidget(),
                    CategoryListWidget(),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }
}
