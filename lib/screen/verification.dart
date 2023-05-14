import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mycontactapp/misc/style.dart';
import 'package:mycontactapp/screen/sign_in.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              maxRadius: 60,
              backgroundColor: Color(0xff31BC8E),
              child: Icon(
                Icons.check,
                size: 50,
                color: Colors.white,
              ),
            ),
            Gap(25),
            Text(
              'Verification email sent!',
              style: headStyle4,
            ),
            Gap(16),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Please check your email to verify your \nmycontactapp account',
                style: subHeadStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Gap(25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff21244A)),
              child: const Text(
                'Done',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
