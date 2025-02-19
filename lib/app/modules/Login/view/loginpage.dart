import 'package:flutter/material.dart';
import 'package:v_track_it/app/modules/Login/controller/login_controller.dart';

import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("VTrackIt")),
      body: FooterView(
        footer: Footer(
          backgroundColor: Colors.grey[200],
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              
              Text(
                "💡 Developed by amF<>SS ",
                style: TextStyle(fontSize: 14),
              ),

              
            ],
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(height * 0.03),
            child: Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: "Username"),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
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
        ],
      ),
    );
  }
}