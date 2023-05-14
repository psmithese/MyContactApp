import 'package:flutter/material.dart';
import 'package:mycontactapp/model/contact_no.dart';

import 'package:mycontactapp/screen/sign_in.dart';
import 'package:provider/provider.dart';

//Future<void>
main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ContactProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
