class FlightData {
  final OnwardFlight onward;
  final ReturnFlight returnFlight;
  final double price;
  final String currency;
  final bool isCheapest;
  final bool isRefundable;
  final String detailsUrl;

  FlightData({
    required this.onward,
    required this.returnFlight,
    required this.price,
    required this.currency,
    required this.isCheapest,
    required this.isRefundable,
    required this.detailsUrl,
  });

  factory FlightData.fromJson(Map<String, dynamic> json) {
    return FlightData(
      onward: OnwardFlight.fromJson(json['flight']['onward']),
      returnFlight: ReturnFlight.fromJson(json['flight']['return']),
      price: json['flight']['price']['amount'].toDouble(),
      currency: json['flight']['price']['currency'],
      isCheapest: json['flight']['isCheapest'],
      isRefundable: json['flight']['isRefundable'],
      detailsUrl: json['flight']['detailsUrl'],
    );
  }
}

class OnwardFlight {
  final String airline;
  final String flightNumber;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final int stops;
  final List<String> stopoverCities;

  OnwardFlight({
    required this.airline,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.stops,
    required this.stopoverCities,
  });

  factory OnwardFlight.fromJson(Map<String, dynamic> json) {
    return OnwardFlight(
      airline: json['airline'],
      flightNumber: json['flightNumber'],
      departureTime: json['departureTime'],
      arrivalTime: json['arrivalTime'],
      duration: json['duration'],
      stops: json['stops'],
      stopoverCities: List<String>.from(json['stopoverCities']),
    );
  }
}

class ReturnFlight {
  final String airline;
  final String flightNumber;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final int stops;
  final List<String> stopoverCities;

  ReturnFlight({
    required this.airline,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.stops,
    required this.stopoverCities,
  });

  factory ReturnFlight.fromJson(Map<String, dynamic> json) {
    return ReturnFlight(
      airline: json['airline'],
      flightNumber: json['flightNumber'],
      departureTime: json['departureTime'],
      arrivalTime: json['arrivalTime'],
      duration: json['duration'],
      stops: json['stops'],
      stopoverCities: List<String>.from(json['stopoverCities']),
    );
  }
}
