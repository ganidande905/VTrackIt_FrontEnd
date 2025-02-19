import 'package:flutter/material.dart';
import 'api_service.dart';
import '../dashboard/dashboard.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  void registerUser() async {
    String email = emailController.text.trim();
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    bool success = await apiService.registerUser(username, email, password);
    if (success) {
      _showOtpDialog(email);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed")),
      );
    }
  }

  void _showOtpDialog(String email) {
    TextEditingController otpController = TextEditingController();

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
              onPressed: () async {
                bool verified = await apiService.verifyOtp(email, otpController.text);
                if (verified) {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Invalid OTP")),
                  );
                }
              },
              child: Text("Verify"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login with OTP")),
      body: Column(
        children: [
          TextField(controller: usernameController, decoration: InputDecoration(labelText: "Username")),
          TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
          TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: registerUser,
            child: Text("Register"),
          ),
        ],
      ),
    );
  }
}