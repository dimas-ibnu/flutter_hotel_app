import 'package:flutter/material.dart';
import 'package:flutter_hotel_app/app/data/models/hotel_model.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../theme/theme_colors.dart';

class VerticalCardItem extends StatelessWidget {
  const VerticalCardItem({super.key, required this.data});

  final HotelDataModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, bottom: 20, top: 10),
      width: Get.width * 0.6,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 5,
                  color: ThemeColors.secondaryColor,
                  offset: Offset(2, 2))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    height: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/image 1.png")),
                        color: ThemeColors.textColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12)))),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(IconlyBold.heart, color: Colors.red[600])))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.3,
                        child: Text(
                          data.hotelName ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        IconlyBold.star,
                        color: Colors.yellow[600],
                      ),
                      Text((data.rating ?? 0).toString())
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                      "${data.address?.streetAddress ?? ''}\n${data.address?.city ?? ''}",
                      style: TextStyle(
                          fontSize: 12, color: ThemeColors.textColor)),
                  SizedBox(height: 5),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 14,
                              color: ThemeColors.primaryColor,
                              fontWeight: FontWeight.w700),
                          children: [
                        TextSpan(text: "\$${data.rating ?? 0}"),
                        TextSpan(
                            text: " /night",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ThemeColors.textColor))
                      ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
