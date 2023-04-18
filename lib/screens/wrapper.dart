import 'package:flutter/material.dart';
import 'package:flutter_unique/constants/colors.dart';
import 'package:flutter_unique/constants/text_styles.dart';
import 'package:flutter_unique/screens/light_on_off/light_on_off.dart';
import 'package:flutter_unique/widgets/button.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  void navigate(Widget navigateMeHere) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => navigateMeHere,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackgroundColor,
      appBar: AppBar(
        title: const Text("Flutter Unique",),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              buttonText: "Light On Off",
              onPressed: () {
                navigate(
                  const LightOnOff(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
