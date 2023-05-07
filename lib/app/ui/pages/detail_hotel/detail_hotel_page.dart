import 'package:flutter/material.dart';
import 'package:flutter_hotel_app/app/ui/theme/theme_colors.dart';
import 'package:iconly/iconly.dart';

import '../../../data/models/hotel_model.dart';

class DetailHotelPage extends StatelessWidget {
  const DetailHotelPage({super.key, required this.data});

  final HotelDataModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(data.hotelName ?? ''),
          titleTextStyle: const TextStyle(
              fontSize: 16,
              color: ThemeColors.textColorBold,
              fontWeight: FontWeight.bold),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(IconlyLight.heart),
            ),
            IconButton(onPressed: () {}, icon: const Icon(IconlyLight.send))
          ],
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/image 1.png',
                      ),
                      fit: BoxFit.cover)),
            ),
            Row(
              children: [
                Text(data.hotelName ?? ''),
              ],
            ),
            listFacilities(),
          ],
        ));
  }

  Widget listFacilities() {
    return Wrap(
      children: List.generate(
          data.rooms?.length ?? 0,
          (index) => facilityItem(
              data.rooms?[index].description ?? '', IconlyLight.work)),
    );
  }

  Widget facilityItem(String title, IconData icon) {
    return Chip(label: Text(title), avatar: Icon(icon));
  }
}
