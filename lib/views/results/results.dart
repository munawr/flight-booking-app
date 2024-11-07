// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../model/results_model.dart';
import 'widgets/flight_card.dart';
import 'widgets/top_cards.dart';

Future<List<FlightData>> fetchFlightData() async {
  try {
    final String response =
        await rootBundle.loadString('assets/data/search_results.json');
    final data = json.decode(response);

    List<FlightData> flights = (data['searchResults'] as List)
        .map((i) => FlightData.fromJson(i))
        .toList();

    return flights;
  } catch (e) {
    print("Error loading JSON data: $e");
    return [];
  }
}

class FlightSearchResultScreen extends StatefulWidget {
  const FlightSearchResultScreen({super.key});

  @override
  _FlightSearchResultScreenState createState() =>
      _FlightSearchResultScreenState();
}

class _FlightSearchResultScreenState extends State<FlightSearchResultScreen> {
  List<FlightData> flights = [];

  @override
  void initState() {
    super.initState();
    loadFlightData();
  }

  void loadFlightData() async {
    List<FlightData> loadedFlights = await fetchFlightData();
    setState(() {
      flights = loadedFlights;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ezy Travel"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FlightTopCard(),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable inner scrolling
              itemCount: flights.length,
              itemBuilder: (context, index) {
                return FlightCard(flightData: flights[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
