import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000/user_auth/";

  Future<bool> registerUser(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse("${baseUrl}register/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password
      }),
    );

    return response.statusCode == 201;
  }

  Future<bool> verifyOtp(String email, String otp) async {
    final response = await http.post(
      Uri.parse("${baseUrl}verify-otp/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "otp": otp}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String token = data['access_token'];

      // Store token for authentication
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      return true;
    } else {
      return false;
    }
  }
}