import 'package:amazon/constants/common_functions.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'auth_screens.dart';

class OTPScreen extends StatefulWidget {
  final String mobileNumber;

  const OTPScreen({super.key, required this.mobileNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: heightDevice,
            width: widthDevice,
            padding: EdgeInsets.symmetric(
              horizontal: widthDevice * 0.03,
              vertical: heightDevice * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Authentication Required",
                  style: textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CommonFunctions.blankSpace(heightDevice * 0.01, 0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.mobileNumber,
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' Change', style: textTheme.labelMedium),
                    ],
                  ),
                ),
                CommonFunctions.blankSpace(heightDevice * 0.02, 0),
                Text(
                  "We have sent a One Time Password(OTP) to the mobile number above. Please enter it to complete verification.",
                  style: textTheme.bodyMedium,
                ),
                CommonFunctions.blankSpace(heightDevice * 0.02, 0),
                SizedBox(
                  height: heightDevice * 0.06,
                  width: widthDevice * 0.94,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    style: textTheme.displaySmall,
                    textAlignVertical: TextAlignVertical.center,
                    // textAlign: TextAlign.center,
                    controller: otpController,
                    decoration: InputDecoration(
                      hintStyle: textTheme.bodySmall,
                      hintText: "Enter OTP",
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
                CommonFunctions.blankSpace(heightDevice * 0.02, 0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        widthDevice * 0.94,
                        heightDevice * 0.06,
                      ),
                      backgroundColor: amber),
                  child: Text(
                    "Continue",
                    style: textTheme.displaySmall,
                  ),
                ),
                CommonFunctions.blankSpace(heightDevice * 0.03, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend OTP",
                        style: textTheme.bodyMedium!.copyWith(
                          color: blue,
                        ),
                      ),
                    ),
                  ],
                ),
                BottomAuthScreenWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
