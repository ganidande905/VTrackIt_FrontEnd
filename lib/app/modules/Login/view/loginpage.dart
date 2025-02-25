import 'package:flutter/material.dart';
import 'package:v_track_it/app/modules/Login/controller/login_controller.dart';
import 'package:v_track_it/app/utils/constants.dart';
import 'package:v_track_it/app/utils/customdropdown.dart';
import 'package:v_track_it/app/utils/customtextfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final List<String> hostelNames = ['Hostel A', 'Hostel B', 'Hostel C'];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 0, left: width * 0.08, right: width*0.08),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height*0.02, bottom : height*0.02),
                  child: Image.asset(
                      'lib/app/utils/icons/Amrita_Vishwa_Vidyapeetham_-_Logo_Icon.svg.png',
                      ),
                ),
                CustomTextField(
                  label: 'MAIL',
                  controller: _mailController,
                ),
                CustomTextField(
                  label: 'USERNAME',
                  controller: _usernameController,
                ),
                CustomDropdown(
                  hostelNames: hostelNames,
                ),
                Padding(
                  padding:  EdgeInsets.all(height*0.05),
                  child: SizedBox(
                    width: width*0.9,
                    child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kUnderLineEnabled,
                      
                    ),
                    child: const Text('REGISTER',
                    style: TextStyle(color: kPrimaryBackgroundColor),),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(height*0.09),
                  child: SizedBox(height: height*0.1,
                  child: 
                  Text('Developed by amF<>SS'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
