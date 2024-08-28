library stepper;

import 'package:flutter/material.dart';

class StepperComponent extends StatelessWidget {
  final int index;
  final int currentIndex;
  final VoidCallback onTap;
  final bool isLast;
  final IconData icon;
  final StepperStatus status;
  final Color? concolor;

  const StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
    required this.icon,
    required this.status,
    this.concolor,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color borderColor;
    IconData displayIcon;

    switch (status) {
      case StepperStatus.complete:
        backgroundColor = const Color.fromARGB(255, 106, 206, 12);
        borderColor = Colors.green;
        displayIcon = Icons.check;
        break;
      case StepperStatus.warning:
        backgroundColor = Colors.amber;
        borderColor = const Color.fromARGB(255, 207, 193, 68);
        displayIcon = Icons.close;
        break;
      default:
        backgroundColor =
            index == currentIndex ? Colors.blue : Colors.transparent;
        borderColor = currentIndex >= index
            ? const Color.fromARGB(255, 29, 128, 209)
            : Colors.black12;
        displayIcon = index == currentIndex ? icon : icon;
    }

    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: backgroundColor,
                        border: Border.all(width: 2, color: borderColor),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        displayIcon,
                        color: index == currentIndex
                            ? Colors.white
                            : Colors.black12,
                        size: 18,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: currentIndex >= index + 1
                        ? const Color.fromARGB(255, 29, 128, 209)
                        : Colors.black12,
                  ),
                ],
              ),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: backgroundColor,
                          border: Border.all(width: 2, color: borderColor),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          displayIcon,
                          color: index == currentIndex
                              ? Colors.white
                              : Colors.black12,
                          size: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        color: concolor ?? borderColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}

enum StepperStatus {
  defaultStatus,
  complete,
  warning,
}
