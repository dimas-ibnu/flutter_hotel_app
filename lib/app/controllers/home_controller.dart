import 'package:flutter_hotel_app/app/data/models/hotel_model.dart';
import 'package:flutter_hotel_app/app/data/services/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var listHotels = <HotelDataModel>[].obs;

  getHotels() async {
    await ApiService()
        .getHotels()
        .then((value) => listHotels.value = value.value!);
  }
}