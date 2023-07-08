import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mycontactapp/misc/style.dart';
import 'package:mycontactapp/screen/sign_in.dart';
import 'package:mycontactapp/screen/verification.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureText2 = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                const Align(
                    alignment: Alignment.center,
                    child: Text('MyContactApp', style: headStyle4)),
                const Gap(30),
                const Text(
                  'Sign Up',
                  style: headStyle4,
                ),
                const Gap(8),
                const Text(
                  'create your mycontactapp account',
                  style: subHeadStyle,
                ),
                const Gap(16),
                const Text(
                  'Email',
                  style: headStyle2,
                ),
                const Gap(8),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                      hintText: 'example@email.com',
                      border: OutlineInputBorder()),
                ),
                const Gap(16),
                const Text(
                  'Password',
                  style: headStyle2,
                ),
                const Gap(8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      hintText: '********',
                      border: const OutlineInputBorder()),
                ),
                const Gap(16),
                const Text(
                  'Confirm Password',
                  style: headStyle2,
                ),
                const Gap(8),
                TextFormField(
                  obscureText: _obscureText2,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please re-enter your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText2
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText2 = !_obscureText2;
                          });
                        },
                      ),
                      hintText: '********',
                      border: const OutlineInputBorder()),
                ),
                const Gap(16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerificationScreen()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: const Color(0xff21244A)),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: subHeadStyle,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()));
                        },
                        child: const Text(
                          'Sign In',
                          style: headStyle2,
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
