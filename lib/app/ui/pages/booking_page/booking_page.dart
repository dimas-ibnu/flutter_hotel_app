
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/booking_controller.dart';


class BookingPage extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookingPage'),
      ),
      body: SafeArea(
        child: Text('BookingController'),
      ),
    );
  }
}
  