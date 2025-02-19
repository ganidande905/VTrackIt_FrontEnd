import 'package:flutter/material.dart';
import 'package:v_track_it/app/api/api_service.dart';
import 'package:v_track_it/app/modules/Login/dashboard/dashboard.dart';
import 'package:v_track_it/app/modules/Login/model/login_model.dart';
import 'package:v_track_it/app/utils/uihelpers.dart';


class LoginController {
  final ApiService apiService = ApiService();

  void registerUser(BuildContext context, TextEditingController usernameController, 
      TextEditingController emailController, TextEditingController passwordController) async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || username.isEmpty || password.isEmpty) {
      UIHelpers.showSnackBar(context, "All fields are required");
      return;
    }

    User newUser = User(username: username, email: email, password: password);

    bool success = await apiService.registerUser(newUser.username, newUser.email, newUser.password);
    if (success) {
      _requestOtpVerification(context, newUser.email);
    } else {
      UIHelpers.showSnackBar(context, "Registration failed");
    }
  }

  void _requestOtpVerification(BuildContext context, String email) {
    TextEditingController otpController = TextEditingController();

    UIHelpers.showOtpDialog(
      context: context,
      otpController: otpController,
      onVerify: () async {
        bool verified = await apiService.verifyOtp(email, otpController.text);
        if (verified) {
          Navigator.of(context).pop(); // Close dialog
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          UIHelpers.showSnackBar(context, "Invalid OTP");
        }
      },
    );
  }
}