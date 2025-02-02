import 'package:url_launcher/url_launcher.dart';

class AuthController {
  static Future<void> redirectToMicrosoftLogin() async {
    const String loginUrl = "https://login.microsoftonline.com/";

    if (await canLaunch(loginUrl)) {
      await launch(loginUrl);
    } else {
      throw "Could not launch $loginUrl";
    }
  }
}