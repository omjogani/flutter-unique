import 'package:flutter/material.dart';
import 'package:flutter_unique/constants/colors.dart';
import 'package:flutter_unique/constants/shadows.dart';
import 'package:flutter_unique/constants/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });
  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: size.width * 0.80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: kShadow,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(13.0),
        child: Text(
          buttonText,
          style: kTitleStyle,
        ),
      ),
    );
  }
}
