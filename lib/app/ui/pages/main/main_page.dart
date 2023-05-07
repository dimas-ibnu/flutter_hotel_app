import 'package:flutter/material.dart';
import 'package:flutter_hotel_app/app/ui/global_widgets/bottom_navbar_widget.dart';
import 'package:get/get.dart';
import '../../../controllers/main_controller.dart';
import '../booking_page/booking_page.dart';
import '../home/home_page.dart';
import '../profile_page/profile_page.dart';
import '../search_page/search_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<Widget> pages = [
    HomePage(),
    BookingPage(),
    SearchPage(),
    ProfilePage(),
  ];

  final MainController controller =
      Get.isRegistered() ? Get.find() : Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavbarWidget(),
        body: SafeArea(child: Obx(() {
          return Container(
            child: pages.elementAt(controller.selectedPage.value),
          );
        })));
  }
}
