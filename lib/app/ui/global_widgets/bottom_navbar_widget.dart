// create widget bottom navbar widget
import 'package:flutter/material.dart';
import 'package:flutter_hotel_app/app/controllers/main_controller.dart';
import 'package:flutter_hotel_app/app/ui/theme/theme_colors.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';


class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
        init: Get.put(MainController()),
        initState: (_) {},
        builder: (_) {
          return BottomNavigationBar(
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle:
                const TextStyle(color: ThemeColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 12),
            onTap: (index) {
              _.selectedPage.value = index;
            },
            mouseCursor: SystemMouseCursors.click,
            currentIndex: _.selectedPage.value,
            selectedItemColor: ThemeColors.primaryColor,
            unselectedItemColor: ThemeColors.textColor,
            items: const [
              BottomNavigationBarItem(
                activeIcon:
                    Icon(IconlyBold.home, color: ThemeColors.primaryColor),
                icon: Icon(IconlyLight.home, color: ThemeColors.textColor),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(IconlyBold.calendar,
                      color: ThemeColors.primaryColor),
                  icon:
                      Icon(IconlyLight.calendar, color: ThemeColors.textColor),
                  label: "Booking"),
              BottomNavigationBarItem(
                  activeIcon:
                      Icon(IconlyBold.search, color: ThemeColors.primaryColor),
                  icon: Icon(IconlyLight.search, color: ThemeColors.textColor),
                  label: "Search"),
              BottomNavigationBarItem(
                  activeIcon:
                      Icon(IconlyBold.profile, color: ThemeColors.primaryColor),
                  icon: Icon(IconlyLight.profile, color: ThemeColors.textColor),
                  label: "Profile"),
            ],
          );
        });
  }
}
