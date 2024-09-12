import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/app_colors.dart';

class MyThemeData{
  static final ThemeData lightTheme=ThemeData(

    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    ),
      bottomSheetTheme:const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
          )
        )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor:AppColors.grayColor,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
          elevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor
      ),
      textTheme:TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
        titleMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
        ),
      )
  );
}