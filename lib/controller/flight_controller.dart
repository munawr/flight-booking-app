// import 'dart:convert';
// import 'package:flutter/services.dart';
// import '../model/flight.dart';

// class FlightController {
//   static Future<List<Flight>> getFlights() async {
//     try {
//       final String response = await rootBundle.loadString('assets/data/flight_data.json');
//       final data = json.decode(response) as List<dynamic>;
      
//       // Ensure each JSON entry is mapped to a `Flight` object
//       return data.map((json) => Flight.fromJson(json as Map<String, dynamic>)).toList();
//     } catch (e) {
//       print("Error loading flights: $e");
//       return []; // Return an empty list on error
//     }
//   }
// }
