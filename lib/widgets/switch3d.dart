import 'package:flutter/material.dart';
import 'package:flutter_unique/constants/colors.dart';

class Switch3D extends StatefulWidget {
  const Switch3D({
    super.key,
    this.isSwitchOn = false,
    required this.onSwitchToggle,
  });
  final bool isSwitchOn;
  final Function onSwitchToggle;

  @override
  State<Switch3D> createState() => Switch3DState();
}

class Switch3DState extends State<Switch3D> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 300.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: widget.isSwitchOn
                ? const Color(0xFFCCAA00)
                : const Color(0xFFA3B1C6),
            offset: const Offset(0, 12),
            blurRadius: 16.0,
          ),
        ],
      ),
      child: Center(
        child: Container(
          height: 125.0,
          width: 80.0,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: kLightBackgroundColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 12),
                blurRadius: 16.0,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () => widget.onSwitchToggle(),
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8195b1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: widget.isSwitchOn ? 12.0 : 1.5,
                    bottom: widget.isSwitchOn ? 1.5 : 12.0,
                    left: 1.5,
                    right: 1.5,
                  ),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: widget.isSwitchOn
                            ? switchGradient
                            : switchGradient.reversed.toList(),
                      ),
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
