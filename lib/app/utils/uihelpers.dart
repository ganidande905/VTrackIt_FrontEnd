import 'package:flutter/material.dart';

class UIHelpers {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showOtpDialog({
    required BuildContext context,
    required TextEditingController otpController,
    required VoidCallback onVerify,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter OTP"),
          content: TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "OTP"),
          ),
          actions: [
            TextButton(
              onPressed: onVerify,
              child: Text("Verify"),
            ),
          ],
        );
      },
    );
  }
}