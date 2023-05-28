import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:partner_mobile/common_widgets/app_button.dart';
import 'package:partner_mobile/provider/google_signin_provider.dart';
import 'package:partner_mobile/screens/login_screen.dart';
import 'package:partner_mobile/styles/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    setState(() {
      user = FirebaseAuth.instance.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            getProfileOfUser(user),
            const SizedBox(
              height: 20,
            ),
            logoutButton(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget getImageHeader(user) {
    String imagePath = "assets/images/profile.png";
    if(user!=null){
      imagePath = user.photoURL!;
      return CircleAvatar(
        radius: 5.0,
        backgroundImage: NetworkImage(imagePath),
        backgroundColor: AppColors.primaryColor.withOpacity(0.7),
      );
    }
    else {
      return CircleAvatar(
        radius: 5.0,
        backgroundImage: AssetImage(imagePath),
        backgroundColor: AppColors.primaryColor.withOpacity(0.7),
      );
    }
  }

  Widget logoutButton() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 0,
          backgroundColor: const Color(0xffF2F3F2),
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 25),
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Icon(
                Icons.logout,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              "Log Out",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) =>
            const Center(child: CircularProgressIndicator()),
          );

          GoogleSignInProvider googleSignInProvider =
          GoogleSignInProvider();
          await googleSignInProvider.googleLogout();
          setState(() {
            user = null;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget getProfileOfUser(user) {
    if (user != null) {
      return Column(
        children: [
          ListTile(
            leading: SizedBox(width: 65, height: 65, child: getImageHeader(user)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  user.displayName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    FontAwesomeIcons.pen,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
              ],
            ),
            subtitle: Text(
              user?.email,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff7C7C7C),
                  fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30),
                child: const Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.rankingStar,
                      color: Colors.black,
                      size: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Đồng",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 90),
                child: const Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.wallet,
                      color: Colors.black,
                      size: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "3000 points",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonWidget(
              text: "Login",
              roundness: 10,
              thickness: 1,
              fontWeight: FontWeight.bold,
              padding: const EdgeInsets.all(10),
              fontSize: 18,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const LoginScreen(),
                    type: PageTransitionType.bottomToTop,
                    duration: const Duration(milliseconds: 200),
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
              padding: const EdgeInsets.all(10),
              fontSize: 18,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const LoginScreen(),
                    type: PageTransitionType.bottomToTop,
                    duration: const Duration(milliseconds: 200),
                  ),
                );
              },
              textColor: AppColors.darkGrey,
              borderColor: AppColors.darkGrey,
            ),
          ],
        ),
      );
    }
  }
}

