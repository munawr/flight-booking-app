import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/assets.dart';
import '../../../core/fonts.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppAssets.banner, fit: BoxFit.cover),
        Positioned(
          left: 16,
          top: 16,
          child: Text(
            'Explore the World',
            style: AppFonts.primaryFont(size: 24, color: Colors.white),
          ),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: SvgPicture.asset(AppAssets.notification),
        ),
      ],
    );
  }
}
