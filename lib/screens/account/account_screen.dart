import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_app/common_widgets/customize_button.dart';
import 'package:grocery_app/helpers/column_with_seprator.dart';
import 'package:grocery_app/screens/login_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:page_transition/page_transition.dart';

import '../../common_widgets/app_text.dart';
import 'account_item.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                height: 65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonWidget(
                      text: "Login",
                      roundness: 10,
                      thickness: 1,
                      fontWeight: FontWeight.bold,
                      padding: EdgeInsets.all(10),
                      fontSize: 18,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: LoginScreen(),
                            type: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 200),
                          ),
                        );
                      },
                      textColor: AppColors.primaryColor,
                    ),
                    ButtonWidget(
                      text: "Register",
                      roundness: 10,
                      thickness: 1,
                      fontWeight: FontWeight.bold,
                      padding: EdgeInsets.all(10),
                      fontSize: 18,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: LoginScreen(),
                            type: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 200),
                          ),
                        );
                      },
                      textColor: AppColors.darkGrey,
                      borderColor: AppColors.darkGrey,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: SizedBox(
                          width: 65, height: 65, child: getImageHeader()),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Vong Quoc Phi",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              CupertinoIcons.pen,
                              color: Color(0xff53B175),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      subtitle: AppText(
                        text: "phivq2002@gmail.com",
                        color: Color(0xff7C7C7C),
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.rankingStar,
                                color: Colors.black,
                                size: 15,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AppText(
                                text: "Sắt",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 90),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.wallet,
                                color: Colors.black,
                                size: 15,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AppText(
                                text: "3000 points",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: getChildrenWithSeperator(
                  widgets: accountItems.map((e) {
                    return getAccountItemWidget(e);
                  }).toList(),
                  seperator: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              logoutButton(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutButton() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 0,
          backgroundColor: Color(0xffF2F3F2),
          textStyle: TextStyle(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 25),
          minimumSize: const Size.fromHeight(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                "assets/icons/account_icons/logout_icon.svg",
              ),
            ),
            Text(
              "Log Out",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Container()
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget getImageHeader() {
    String imagePath = "assets/images/profile.png";
    return CircleAvatar(
      radius: 5.0,
      backgroundImage: AssetImage(imagePath),
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
    );
  }

  Widget getAccountItemWidget(AccountItem accountItem) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              accountItem.iconPath,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            accountItem.label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
