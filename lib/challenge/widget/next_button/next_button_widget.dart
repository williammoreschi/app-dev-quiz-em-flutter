import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color boderColor;
  final Color overlayColor;
  final VoidCallback onTap;
  const NextButtonWidget({
    Key? key, 
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.boderColor,
    required this.overlayColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.darkGreen({required String label, required VoidCallback onTap})
  : this.backgroundColor = AppColors.darkGreen, 
  this.fontColor = AppColors.white, 
  this.boderColor = AppColors.lightGreen,
  this.overlayColor = AppColors.green,
  this.label = label,
  this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
  : this.backgroundColor = AppColors.white, 
  this.fontColor = AppColors.grey, 
  this.boderColor = AppColors.border,
  this.overlayColor = AppColors.border,
  this.label = label,
  this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(overlayColor),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: boderColor

            )
          )
        ),
        onPressed: onTap, 
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor
          ),
        )
      ),
    );
  }
}