import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String phoneNumber = '';
  String verificationId = '';
  String otp = '';

  updatePhoneNum({
    required String num,
  }) {
    phoneNumber = num;
    notifyListeners();
  }

  updateVerificationId({
    required String id,
  }) {
    verificationId = id;
    notifyListeners();
  }

  updateOTP({
    required String otpp,
  }) {
    otp = otpp;
    notifyListeners();
  }
}
