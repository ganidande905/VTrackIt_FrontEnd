import 'package:flutter/material.dart';
import 'package:v_track_it_frontend/app/utils/constants.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});
  
@override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondaryBackgroundColor, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Logo and App Name
            Container(
              width: double.infinity,
              height: screenHeight* 0.45,
              color: kPrimaryBackgroundColor, 
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'lib/app/utils/icons/Vidyut_Logo.png', 
                      height: screenHeight*0.2,
                      width: screenWidth*0.4,
                      fit: BoxFit.cover,
                    ),
                     SizedBox(height: screenHeight*0.04),
                    const Text(
                      "V-track-it",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: kSecondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Main Login Section
            Container(
              transform: Matrix4.translationValues(0, -20, 0), // Overlap effect
              height: screenHeight * 0.5,
              decoration: const BoxDecoration(
                color: kSecondaryBackgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title
                    const Text(
                      "LogIn",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryTextColor,
                      ),
                    ),
                     SizedBox(height: screenHeight*0.20),

                    // Microsoft Login Button
                    ElevatedButton(
                      onPressed: () async{},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryBackgroundColor, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 80,
                        ),
                      ),
                      child: const Text(
                        "LOGIN WITH MICROSOFT",
                        style: TextStyle(
                          color: kSecondaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                     SizedBox(height: screenHeight*0.01),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 

