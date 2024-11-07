import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/assets.dart';
import '../../core/colors.dart';
import '../../core/fonts.dart';
import '../results/results.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('Search Flights',
            style: AppFonts.primaryFont(size: 18, color: Colors.white)),
        backgroundColor: AppColors.primaryGreen,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Section
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.banner),
                    fit: BoxFit.cover,
                  ),
                  // borderRadius: BorderRadius.circular(12),
                ),
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Text('Let\'s start your trip',
                          style: AppFonts.primaryFont(
                              size: 15, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Flight Search Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildTabButton("Round Trip", false),
                        buildTabButton("One Way", true),
                        buildTabButton("Multi-city", false),
                      ],
                    ),
                    const SizedBox(height: 16),
                    buildTextField(
                        iconPath: AppAssets.flightGreen,
                        hintText: "From - City or Airport"),
                    const SizedBox(height: 8),
                    buildTextField(
                        iconPath: AppAssets.location,
                        hintText: "To - City or Airport"),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                            iconData: Icons.calendar_today,
                            hintText: "Departure",
                            isDate: true,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: buildTextField(
                            iconData: Icons.calendar_today,
                            hintText: "Return",
                            isDate: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: buildOptionButton("1 Passenger"),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: buildOptionButton("Economy Class"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const FlightSearchResultScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("Search Flights",
                          style: AppFonts.primaryFont(
                              size: 16, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Travel Inspirations Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Travel Inspirations",
                    style: AppFonts.primaryFont(size: 18, color: Colors.black)),
              ),
              // SizedBox(height: 8),
              buildInspirationRow(),

              // SizedBox(height: 20),
              // Flight & Hotel Packages Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Flight & Hotel Packages",
                    style: AppFonts.primaryFont(size: 18, color: Colors.black)),
              ),
              // SizedBox(height: 12),
              buildPackageCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabButton(String title, bool color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color ? AppColors.secondaryGreen : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
            child: Text(title,
                style: AppFonts.primaryFont(
                    size: 14,
                    color: color ? Colors.white : AppColors.greyText))),
      ),
    );
  }

  Widget buildTextField({
    String? iconPath, // Path to the SVG asset
    IconData? iconData, // Regular icon data
    required String hintText,
    bool isDate = false,
  }) {
    return TextField(
      readOnly: isDate,
      onTap: isDate ? () => _selectDate() : null,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: iconPath != null
              ? SvgPicture.asset(
                  iconPath,
                  color: AppColors.primaryGreen,
                  height: 24,
                  width: 24,
                )
              : Icon(
                  iconData ?? Icons.search, // Default icon if both are null
                  color: AppColors.primaryGreen,
                  size: 24,
                ),
        ),
        hintText: hintText,
        hintStyle: AppFonts.primaryFont(size: 14, color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    // Placeholder for date picker logic
    // You can integrate a DatePicker here if needed
  }

  Widget buildOptionButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text(text, style: AppFonts.primaryFont(size: 14))),
    );
  }

  Widget buildInspirationRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildInspirationCard(AppAssets.saudi, "Saudi Arabia"),
          buildInspirationCard(AppAssets.kuwait, "Kuwait"),
        ],
      ),
    );
  }

  Widget buildInspirationCard(String image, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
            ),
          ),
          child: Text(
            title,
            style: AppFonts.primaryFont(size: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildPackageCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(AppAssets.bestPrice),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
