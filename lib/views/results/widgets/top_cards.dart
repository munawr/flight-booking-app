import 'package:flight_booking_app/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FlightTopCard extends StatelessWidget {
  const FlightTopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Route and dates
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "BLR - Bengaluru to DXB - Dubai",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Departure: Sat, 23 Mar - Return: Sat, 23 Mar",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            // Round Trip and Modify Search Links
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "(Round Trip)",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Modify Search",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            // Non-Stop and Filter Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("Sort"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppAssets.arrowDown),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Non - Stop",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Date Options
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _dateOption("Mar 22 - Mar 23", "AED 741"),
                  _dateOption("Mar 23 - Mar 24", "AED 721", isSelected: true),
                  _dateOption("Mar 24 - Mar 25", "AED 750"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function for date options
  Widget _dateOption(String date, String price, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green[100] : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.transparent,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text("From $price"),
        ],
      ),
    );
  }
}
