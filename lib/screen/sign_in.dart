import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mycontactapp/misc/style.dart';
import 'package:mycontactapp/screen/contact_list.dart';

import 'package:mycontactapp/screen/sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text('MyContactApp', style: headStyle4)),
                Gap(50),
                Text(
                  'Sign in',
                  style: headStyle4,
                ),
                Gap(8),
                Text(
                  'Log into your mycontactapp account',
                  style: subHeadStyle,
                ),
                Gap(16),
                Text(
                  'Email',
                  style: headStyle2,
                ),
                const Gap(8),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'example@email.com',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value?.trim();
                  },
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Password', style: headStyle2),
                    Text(
                      'Forget password?',
                      style: headStyle2,
                    ),
                  ],
                ),
                const Gap(8),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value?.trim();
                  },
                  decoration: InputDecoration(
                      hintText: '********', border: OutlineInputBorder()),
                ),
                const Gap(16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactList()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: const Color(0xff21244A)),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: subHeadStyle,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: Text(
                          'Sign Up',
                          style: headStyle1,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
