import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              icon(),
              welcomeTextWidget(),
              SizedBox(
                height: 10,
              ),
              sloganText(),
              SizedBox(
                height: 40,
              ),
              getButton(context),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget icon() {
    String iconPath = "assets/images/appLogo.png";
    return Image.asset(
      iconPath,
      width: 300,
      height: 300,
      color: Colors.white,
    );
  }

  Widget welcomeTextWidget() {
    return Column(
      children: [
        AppText(
          text: "Welcome",
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        AppText(
          text: "to our store",
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget sloganText() {
    return AppText(
      text: "Get your favorite gear to improve your productivity",
      textAlign: TextAlign.center,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xffFCFCFC).withOpacity(0.7),
    );
  }

  Widget getButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: AppButton(
        label: "Get Started",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 25),
        onPressed: () {
          onGetStartedClicked(context);
        },
      ),
    );
  }

  void onGetStartedClicked(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        child: DashboardScreen(),
        type: PageTransitionType.fade,
        duration: Duration(milliseconds: 1000),
      ),
    );
  }
}
