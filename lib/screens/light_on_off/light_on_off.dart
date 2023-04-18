import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unique/constants/colors.dart';
import 'package:torch_light/torch_light.dart';
import 'package:flutter_unique/widgets/switch3d.dart';

class LightOnOff extends StatefulWidget {
  const LightOnOff({super.key});

  @override
  State<LightOnOff> createState() => _LightOnOffState();
}

class _LightOnOffState extends State<LightOnOff> {
  bool isLightON = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isLightON ? const Color(0xFFffe76c) : kLightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              isLightON
                  ? "assets/images/light_on_off/light-on.png"
                  : "assets/images/light_on_off/light-off.png",
              height: 200.0,
              width: 200.0,
            ),
            const SizedBox(height: 20.0),
            Switch3D(
              isSwitchOn: isLightON,
              onSwitchToggle: () async {
                try {
                  // Play click sound
                  final player = AudioPlayer();
                  await player.play(AssetSource('sounds/button-click.mp3'));
                  HapticFeedback.lightImpact();

                  // Toggle Flash Light
                  if (isLightON) {
                    await TorchLight.disableTorch();
                  } else {
                    await TorchLight.enableTorch();
                  }

                  // Update the State of Screen
                  setState(() {
                    isLightON = !isLightON;
                  });
                } on Exception catch (e) {
                  throw Exception(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
