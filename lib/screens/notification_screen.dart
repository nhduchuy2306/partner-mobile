import 'package:flutter/cupertino.dart';
import 'package:grocery_app/common_widgets/app_text.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AppText(
          text: "No Notification Items",
          fontWeight: FontWeight.w600,
          color: Color(0xFF7C7C7C),
        ),
      ),
    );
  }
}
