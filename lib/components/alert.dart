import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomy_finder/data/enums.dart';

class Alert extends StatelessWidget {
  const Alert({
    super.key,
    required this.text,
    this.severity = Severity.info,
    this.trailing,
  });
  final String text;
  final Severity severity;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final Icon icon;
    final Color borderColor;
    final iconColor = Get.isDarkMode ? Colors.black54 : Colors.white;
    switch (severity) {
      case Severity.suceess:
        borderColor = Colors.green;
        icon = Icon(Icons.check_circle_outline, size: 40, color: iconColor);
        break;
      case Severity.error:
        borderColor = Colors.red;
        icon = Icon(Icons.error, size: 40, color: iconColor);
        break;
      case Severity.warning:
        borderColor = const Color.fromARGB(255, 216, 195, 6);
        icon = Icon(Icons.warning, size: 40, color: iconColor);
        break;
      case Severity.info:
        borderColor = Colors.blue;
        icon = Icon(Icons.info, size: 40, color: iconColor);
        break;
    }
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 60, right: 2, top: 2, bottom: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: borderColor,
          ),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Row(
              children: [
                Expanded(child: Text(text)),
                if (trailing != null) trailing!
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: icon,
        ),
      ],
    );
  }
}
