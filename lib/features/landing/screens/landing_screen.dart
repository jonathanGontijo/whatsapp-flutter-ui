import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome to WhatsApp',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              'assets/backgroundImage.png',
              height: 340,
              width: 340,
            ),
            SizedBox(height: size.height / 9),
            const Text(
              'Connect with your friends and family',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
                width: size.width * 0.75,
                child: CustomButton(
                    text: "AGREE AND CONTINUE",
                    onPressed: () => navigateToLoginScreen(context))),
          ],
        ),
      )),
    );
  }
}
