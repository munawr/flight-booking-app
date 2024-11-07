import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/assets.dart';

class FlightHotelRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Image.asset(AppAssets.flightsandhotels),
            Text('Flights'),
          ],
        ),
        Column(
          children: [
            SvgPicture.asset(AppAssets.accountSettings),
            Text('Hotels'),
          ],
        ),
      ],
    );
  }
}
