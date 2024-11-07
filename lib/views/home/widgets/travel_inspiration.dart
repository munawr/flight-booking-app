import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/flight_provider.dart';

class DatePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingProvider>(context);
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );
        if (picked != null) provider.updateDate(picked);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          provider.selectedDate == null
              ? 'Select Date'
              : provider.selectedDate!.toLocal().toString().split(' ')[0],
        ),
      ),
    );
  }
}
