import 'package:flutter/material.dart';
import 'package:v_track_it/app/modules/Login/controller/login_controller.dart';
import 'package:v_track_it/app/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kSecondaryBackgroundColor,
      body: Center(

        child: Padding(
          padding: EdgeInsets.all(height * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: "Username"),
                style: TextStyle(color: kPrimaryTextColor),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email",),
                style: TextStyle(color: kPrimaryTextColor),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                style: TextStyle(color: kPrimaryTextColor),               
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => loginController.registerUser(
                    context, usernameController, emailController, passwordController),
                child: Text("Register"),

              ),
            ],
          ),
        ),
      ),
    );
  }
}