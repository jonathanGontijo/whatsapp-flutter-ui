import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Enter your phone number'),
          elevation: 0,
          backgroundColor: backgroundColor,
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(' Whatsapp will need to verify your phone number'),
            const SizedBox(height: 10),
            TextButton(
              onPressed: pickCountry,
              child: const Text('Pick country'),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                if (country != null) Text('+${country!.phoneCode}'),

                // const Text('+91'),
                const SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: 'Phone number',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.6),
            SizedBox(
              width: 90,
              child: CustomButton(
                text: 'Next',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
