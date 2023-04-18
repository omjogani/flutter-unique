import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:torch_light/torch_light.dart';
import 'package:flutter_unique/widgets/switch3d.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLightON = false;

  double _dragAmount = 0;

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragAmount += details.delta.dy;
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    setState(() {
      _dragAmount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isLightON ? const Color(0xFFffe76c) : const Color(0xFFE0E5EC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              isLightON
                  ? "assets/images/light-on.png"
                  : "assets/images/light-off.png",
              height: 200.0,
              width: 200.0,
            ),
            const SizedBox(height: 20.0),
            Switch3D(
              isSwitchOn: isLightON,
              onSwitchToggle: () async {
                try {
                  final player = AudioPlayer();
                  // await player.setSource(AssetSource('sounds/button-click.mp3'));
                  await player.play(AssetSource('sounds/button-click.mp3'));
                  HapticFeedback.lightImpact();

                  if (isLightON) {
                    await TorchLight.disableTorch();
                  } else {
                    await TorchLight.enableTorch();
                  }
                  setState(() {
                    isLightON = !isLightON;
                  });
                } on Exception catch (e) {
                  // Handle error
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
