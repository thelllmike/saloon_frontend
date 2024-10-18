import 'package:flutter/material.dart';
import 'package:saloon/theme/colors.dart';

class AppTextStyles {
  static const TextStyle loginText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 19,
    fontWeight: FontWeight.w600,
    height: 23.16 / 19, // Line height divided by font size
    color: Colors.black, // Assuming black, modify if needed
  );

  static const TextStyle servicesText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 19.5 / 16,
    color: Colors.black,
  );

  static const TextStyle bestSaloonText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 19.5 / 16,
    color: Colors.black,
  );

  static const TextStyle saloonName = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 9,
    fontWeight: FontWeight.w400,
    height: 10.97 / 9,
    color: Colors.black,
  );

  static const TextStyle reviewsText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 6,
    fontWeight: FontWeight.w400,
    height: 7.31 / 6,
    color: Colors.black,
  );

  static const TextStyle ratingText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 9,
    fontWeight: FontWeight.w400,
    height: 10.97 / 9,
    color: AppColors.black,
    backgroundColor: AppColors.black,
  );
}