import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navigation_controller.dart';
import '../controller/theme_controller.dart';
import 'account/account.dart';
import 'home/home.dart';
import 'shop/shopping.dart';
import 'widgets/custom_bottom_navbar.dart';
import 'wistlist/wishlist.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(
      NavigationController(),
    );

    return GetBuilder<ThemeController>(
      builder: (themeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Obx(
            () => IndexedStack(
              key: ValueKey(navigationController.currentIndex.value),
              index: navigationController.currentIndex.value,
              children: [
                const HomeScreen(),
                const ShoppingScreen(),
                const WishlistScreen(),
                const AccountScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavbar(),
      ),
    );
  }
}
