import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:magueyapp/presentation/home/redux/home_actions.dart';
import 'package:magueyapp/presentation/home/redux/home_state.dart';
import 'package:redux/redux.dart';

class BaseScreen extends StatefulWidget {
  static const String route = "base_screen";
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    initBaseScreen();
    super.initState();
  }

  initBaseScreen() {
    Store<HomeState> store =
        StoreProvider.of<HomeState>(context, listen: false);
    store.state.pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
  }

  disposeBaseScreen() {
    Store<HomeState> store =
        StoreProvider.of<HomeState>(context, listen: false);
    store.state.pageController!.dispose();
  }

  @override
  void deactivate() {
    disposeBaseScreen();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StoreBuilder<HomeState>(
              builder: (context, store) => PopScope(
                canPop: store.state.currentIndex == 0,
                onPopInvoked: (canPop) {
                  if (store.state.currentIndex != 0 &&
                      store.state.isShopMapViewTap) {
                    store.dispatch(NavigationAction(index: 0));
                  }
                },
                child: PageView.builder(
                  itemCount: store.state.screenList.length,
                  physics: store.state.allowMapScrolling
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    if (store.state.currentBtmIndex != index) {
                      store.state.currentBtmIndex = index;
                    }
                  },
                  controller: store.state.pageController!,
                  itemBuilder: (context, index) =>
                      store.state.screenList[index],
                ),
              ),
            ),
          ),
          const Divider(
            color: Color(0xFFE6E54A),
            thickness: 1.0,
            height: 1.0,
          ),
          StoreBuilder<HomeState>(
            builder: (context, store) {
              return BottomNavigationBar(
                currentIndex: store.state.currentBtmIndex,
                onTap: (index) {
                  store.dispatch(NavigationAction(index: index));
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: 'HOME',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: 'MAP',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: 'EVENTS',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: 'ME',
                  ),
                ],
                backgroundColor: const Color(0xFF2B2B2B),
                selectedItemColor: const Color(0xFFE3FF0A),
                unselectedItemColor: const Color(0xFF908C00),
                selectedLabelStyle: const TextStyle(
                  fontFamily: 'CircularXXMono',
                  fontSize: 12,
                  letterSpacing: 0.2,
                  color: Color(0xFFE6E54A),
                  decoration: TextDecoration.underline,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'CircularXXMono',
                  fontSize: 12,
                  letterSpacing: 0.2,
                  color: Colors.grey,
                ),
                type: BottomNavigationBarType.fixed,
              );
            },
          ),
        ],
      ),
    );
  }
}
