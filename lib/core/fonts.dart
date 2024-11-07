import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle primaryFont({double size = 16, Color? color}) {
    return GoogleFonts.roboto(
      fontSize: size,
      color: color ?? Colors.black,
    );
  }
}
