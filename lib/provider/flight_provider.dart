// import 'dart:convert';

import 'package:flutter/material.dart';

// import '../model/results.dart';

class BookingProvider extends ChangeNotifier {
  DateTime? selectedDate;

  void updateDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
//   Future<List<FlightData>> fetchFlightData() async {
//   final String response = await rootBundle.loadString('assets/data/search_results.json');
//   final data = json.decode(response);
//   return (data["searchResults"] as List).map((i) => FlightData.fromJson(i)).toList();
// }
}