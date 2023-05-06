import 'dart:convert';

import 'package:flutter_hotel_app/app/data/models/hotel_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _baseUrl =
      "https://raw.githubusercontent.com/Azure-Samples/azure-search-sample-data/main/hotels/HotelsData_toAzureSearch.JSON";

  Future<HotelModel> getHotels() async {
    var response = await http.get(Uri.parse(_baseUrl));
    return response.body.isNotEmpty
        ? HotelModel.fromJson(jsonDecode(response.body))
        : HotelModel();
  }
}
