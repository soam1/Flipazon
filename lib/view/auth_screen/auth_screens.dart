import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../controller/services/auth_services/auth_services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  String currentCountryCode = "+91";
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();

  signInPart(
      double height, double width, BuildContext context, TextTheme textTheme) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: greyShade3,
        ),
      ),
      child: Column(
        children: [
          Container(
            // color: greyShade1,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: greyShade3),
              ),
              color: greyShade1,
            ),
            height: height * 0.06,
            width: width,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.01,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = false;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: grey),
                    ),
                    alignment: Alignment.center,
                    // color: Colors.white,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: inLogin ? Colors.transparent : secondaryColor,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(
                  0,
                  width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Create Account.  ",
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "New to Amazon?",
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = true;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: grey),
                        ),
                        alignment: Alignment.center,
                        // color: Colors.white,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: inLogin ? secondaryColor : Colors.transparent,
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(
                      0,
                      width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Sign in. ",
                            style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "Already a customer?",
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (val) {
                              setState(() {
                                currentCountryCode = '+${val.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.06,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          color: greyShade2,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: grey),
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.680,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        style: textTheme.displaySmall,
                        textAlignVertical: TextAlignVertical.center,
                        // textAlign: TextAlign.center,
                        controller: mobileNumberController,
                        decoration: InputDecoration(
                          hintStyle: textTheme.bodySmall,
                          hintText: "9876543210",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: secondaryColor,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                ElevatedButton(
                  onPressed: () {
                    AuthServices.receiveOTP(
                        context: context,
                        mobileNo:
                            '$currentCountryCode${mobileNumberController.text.trim()}');
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        width * 0.88,
                        height * 0.06,
                      ),
                      backgroundColor: amber),
                  child: Text(
                    "Continue",
                    style: textTheme.displaySmall,
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By continuing you agree to Amazon\'s ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Conditions of use ',
                        style: textTheme.labelMedium!.copyWith(
                          color: blue,
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Privacy and Terms',
                        style: textTheme.labelMedium!.copyWith(
                          color: blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CreateAccount(
      double height, double width, BuildContext context, TextTheme textTheme) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: greyShade3,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = false;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: grey),
                        ),
                        alignment: Alignment.center,
                        // color: Colors.white,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: !inLogin ? secondaryColor : Colors.transparent,
                        ),
                      ),
                    ),
                    CommonFunctions.blankSpace(
                      0,
                      width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Create Account. ",
                            style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "New to Amazon?",
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),
                //tony stark
                SizedBox(
                  height: 0.06 * height,
                  width: 0.92 * width,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    style: textTheme.displaySmall,
                    textAlignVertical: TextAlignVertical.center,
                    // textAlign: TextAlign.center,
                    controller: nameTextController,
                    decoration: InputDecoration(
                      hintStyle: textTheme.bodySmall,
                      hintText: "Tony Stark",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: secondaryColor,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),
                Text(
                  'By enrolling your mobile phone number, you consent to receive automated security notifications via text message from Amazon.\nMessage and data rates may apply.',
                  style: textTheme.bodyMedium,
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (val) {
                              setState(() {
                                currentCountryCode = '+${val.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.06,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          color: greyShade2,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: grey),
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.680,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        style: textTheme.displaySmall,
                        textAlignVertical: TextAlignVertical.center,
                        // textAlign: TextAlign.center,
                        controller: mobileNumberController,
                        decoration: InputDecoration(
                          hintStyle: textTheme.bodySmall,
                          hintText: "9876543210",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: secondaryColor,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                ElevatedButton(
                  onPressed: () {
                    AuthServices.receiveOTP(
                        context: context,
                        mobileNo:
                            '$currentCountryCode${mobileNumberController.text.trim()}');
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        width * 0.88,
                        height * 0.06,
                      ),
                      backgroundColor: amber),
                  child: Text(
                    "Continue",
                    style: textTheme.displaySmall,
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By continuing you agree to Amazon\'s ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Conditions of use ',
                        style: textTheme.labelMedium!.copyWith(
                          color: blue,
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Privacy and Terms',
                        style: textTheme.labelMedium!.copyWith(
                          color: blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // color: greyShade1,
            decoration: BoxDecoration(
              border: Border(
                // bottom: BorderSide(color: greyShade3),
                top: BorderSide(color: greyShade3),
              ),
              color: greyShade1,
            ),
            height: height * 0.06,
            width: width,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.01,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: grey),
                    ),
                    alignment: Alignment.center,
                    // color: Colors.white,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: inLogin ? secondaryColor : transparent,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(
                  0,
                  width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Sign in.  ",
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "Already a customer?",
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage(
            "assets/images/amazon_logo.png",
          ),
          height: heightDevice * 0.04,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: heightDevice,
            width: widthDevice,
            padding: EdgeInsets.symmetric(
                horizontal: widthDevice * 0.02, vertical: heightDevice * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CommonFunctions.blankSpace(heightDevice * 0.02, 0),
                // signInPart(heightDevice, widthDevice, context, textTheme),
                // CreateAccount(heightDevice, widthDevice, context, textTheme),
                Builder(
                  builder: (context) {
                    if (inLogin) {
                      return signInPart(
                          heightDevice, widthDevice, context, textTheme);
                    } else {
                      return CreateAccount(
                          heightDevice, widthDevice, context, textTheme);
                    }
                  },
                ),
                CommonFunctions.blankSpace(heightDevice * 0.03, 0),
                //lower body part
                BottomAuthScreenWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomAuthScreenWidget extends StatelessWidget {
  const BottomAuthScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          height: 1,
          width: widthDevice,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, greyShade3, Colors.white],
            ),
          ),
        ),
        CommonFunctions.blankSpace(heightDevice * 0.02, 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Condition of use",
              style: textTheme.labelLarge!.copyWith(color: blue),
            ),
            Text(
              "Privacy Notice",
              style: textTheme.labelLarge!.copyWith(color: blue),
            ),
            Text(
              "Help",
              style: textTheme.labelLarge!.copyWith(color: blue),
            ),
          ],
        ),
        CommonFunctions.blankSpace(heightDevice * 0.01, 0),
        Text(
          "©️ 1996-2023, Amazon.com, Inc. or its affiliates",
          style: textTheme.labelMedium!.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
