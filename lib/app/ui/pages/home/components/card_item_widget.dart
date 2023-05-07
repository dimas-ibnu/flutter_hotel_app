import 'package:flutter/material.dart';
import 'package:flutter_hotel_app/app/data/models/hotel_model.dart';
import 'package:flutter_hotel_app/app/ui/pages/detail_hotel/detail_hotel_page.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../theme/theme_colors.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({super.key, required this.data, this.isVerticalCard});

  final HotelDataModel data;
  final bool? isVerticalCard;

  @override
  Widget build(BuildContext context) {
    if (isVerticalCard ?? false) {
      return InkWell(
        onTap: (){
          Get.to(() => DetailHotelPage(data: data));
        },
        child: Container(
          margin: const EdgeInsets.only(right: 20, bottom: 20, top: 10),
          width: Get.width * 0.6,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
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
                            padding: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child:
                                Icon(IconlyBold.heart, color: Colors.red[600])))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
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
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            IconlyBold.star,
                            color: Colors.yellow[600],
                          ),
                          Text((data.rating ?? 0).toString())
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                          "${data.address?.streetAddress ?? ''}\n${data.address?.city ?? ''}",
                          style: const TextStyle(
                              fontSize: 12, color: ThemeColors.textColor)),
                      const SizedBox(height: 5),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: ThemeColors.primaryColor,
                                  fontWeight: FontWeight.w700),
                              children: [
                            TextSpan(text: "\$${data.rating ?? 0}"),
                            const TextSpan(
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
        ),
      );
    } else {
      /// Vertical Card
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(1, 1),
              spreadRadius: 2,
              blurRadius: 10,
              color: ThemeColors.secondaryColor,
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("assets/images/image 1.png"))),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.hotelName ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: Get.width * 0.5,
                  child: Text(
                      "${data.address?.city ?? ''}, ${data.address?.streetAddress ?? ''}\n ${data.address?.postalCode ?? ''}"),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ...List.generate(
                        data.rating?.floor() ?? 0,
                        (index) => Icon(
                              IconlyBold.star,
                              color: Colors.yellow[700],
                            )),
                    Text(
                      " ${data.rating ?? 0}",
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }
  }
}
