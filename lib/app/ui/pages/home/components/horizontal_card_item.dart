import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../data/models/hotel_model.dart';
import '../../../theme/theme_colors.dart';

class HorizontalCardItem extends StatelessWidget {
  const HorizontalCardItem({super.key, required this.data});

  final HotelDataModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
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
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage("assets/images/image 1.png"))),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.hotelName ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: Get.width * 0.5,
                child: Text(
                    "${data.address?.city ?? ''}, ${data.address?.streetAddress ?? ''}\n ${data.address?.postalCode ?? ''}"),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  // Text(
                  //   data.rating.toString(),
                  //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  // ),
                  ...List.generate(
                      Random().nextInt(5),
                      (index) => Icon(
                            IconlyBold.star,
                            color: Colors.yellow[700],
                          ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
