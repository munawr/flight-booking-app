
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets.dart';
import '../../../model/results_model.dart';

class FlightCard extends StatelessWidget {
  final FlightData flightData;

  const FlightCard({required this.flightData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Onward Flight Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  flightData.onward.airline,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "AED ${flightData.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flightData.onward.departureTime,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text("BLR - Bengaluru",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SvgPicture.asset(AppAssets.flightGreen, height: 24, width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      flightData.onward.arrivalTime,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text("DXB - Dubai", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${flightData.onward.duration}, ${flightData.onward.stops} Stops",
                  style: const TextStyle(color: Colors.grey),
                ),
                const Text("Flight Details",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(),

            // Return Flight Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  flightData.returnFlight.airline,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "AED ${flightData.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flightData.returnFlight.departureTime,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text("DXB - Dubai", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SvgPicture.asset(AppAssets.flightGreen, height: 24, width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      flightData.returnFlight.arrivalTime,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text("BLR - Bengaluru",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Divider(
                color: Colors.grey,
                height: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (flightData.isCheapest)
                    const TagWidget(text: "Cheapest", color: Colors.green),
                    const SizedBox(width: 4),
                    // if (flightData.isRefundable)
                      const TagWidget(text: "Refundable", color: Colors.blue),
                  ],
                ),
                const Text("Flight Details",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String text;
  final Color color;

  const TagWidget({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style:
            TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
