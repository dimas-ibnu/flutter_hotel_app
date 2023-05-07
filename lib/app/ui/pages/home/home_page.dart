import 'package:flutter/material.dart';
import 'package:flutter_hotel_app/app/controllers/home_controller.dart';
import 'package:flutter_hotel_app/app/data/services/api_service.dart';
import 'package:flutter_hotel_app/app/ui/pages/home/components/card_item_widget.dart';
import 'package:flutter_hotel_app/app/ui/theme/theme_colors.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../global_widgets/bottom_navbar_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getHotels();
          },
          child: ListView(
            children: [
              _topBar(),
              const SizedBox(height: 10),
              searchBar(),
              sectionLabel("Nearby Your Location"),
              listNearbyHotels(),
              sectionLabel("Popular Destination"),
              listPopularCardItem(),
            ],
          ),
        ));
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Location",
                style: TextStyle(color: ThemeColors.textColor),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    IconlyBold.location,
                    color: ThemeColors.primaryColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Wallace, Australia",
                    style: TextStyle(color: ThemeColors.textColorBold),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: ThemeColors.primaryColor,
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: ThemeColors.textColor),
                borderRadius: BorderRadius.circular(8)),
            child: const Stack(
              children: [
                Icon(IconlyBold.notification),
                Positioned(
                    right: 0,
                    child: Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.red,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search Hotel",
            suffixIcon: IconButton(
              icon: const Icon(
                IconlyBold.filter_2,
                color: ThemeColors.primaryColor,
              ),
              onPressed: () {
                ApiService().getHotels();
              },
            ),
            prefixIcon: const Icon(
              IconlyLight.search,
              color: ThemeColors.textColor,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }

  Widget sectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.w700, color: ThemeColors.textColorBold),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {},
              child: const Text(
                "See All",
                style: TextStyle(fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }

  Widget listNearbyHotels() {
    return GetX<HomeController>(
      init: Get.put(HomeController()),
      initState: (_) {
        _.controller?.getHotels();
      },
      builder: (_) {
        if (_.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Row(
                children: List.generate(
                    _.listHotels.length > 5 ? 5 : _.listHotels.length,
                    (index) => CardItemWidget(
                          isVerticalCard: true,
                          data: _.listHotels[index],
                        ))),
          ),
        );
      },
    );
  }

  Widget listPopularCardItem() {
    return GetX<HomeController>(
      init: Get.put(HomeController()),
      initState: (_) {
        _.controller?.getHotels();
      },
      builder: (_) {
        if (_.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
            children: List.generate(
                _.listHotels.length > 3 ? 3 : _.listHotels.length,
                (index) => CardItemWidget(
                      data: _.listHotels.reversed.toList()[index],
                    )));
      },
    );
  }
}
