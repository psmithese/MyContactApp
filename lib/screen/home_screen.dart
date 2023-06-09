import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mycontactapp/misc/component/bottom_sheet.dart';

import '../misc/style.dart';

class ContactHomeScreen extends StatefulWidget {
  const ContactHomeScreen({super.key});

  @override
  State<ContactHomeScreen> createState() => _ContactHomeScreenState();
}

class _ContactHomeScreenState extends State<ContactHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const ListTile(
            title: Text(
              'Hi,',
              style: headStyle4,
            ),
            subtitle: Text(
              'How are you doing today?',
              style: subHeadStyle,
            ),
            trailing: CircleAvatar(
              backgroundColor: Color(0xffC2C6FF),
              child: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ),
          ),
          const Gap(30),
          const CircleAvatar(
            backgroundColor: Color(0xffe7e7ff),
            maxRadius: 90,
            child: Icon(
              Icons.contact_phone_rounded,
              color: Color(0xfff5dcdc),
              size: 80,
            ),
          ),
          const Gap(20),
          const Text(
            'No Contact',
            style: headStyle4,
          ),
          const Gap(8),
          const Text(
            'To start adding your contacts, tap on the "Add"  \nbutton below',
            style: subHeadStyle,
            textAlign: TextAlign.center,
          ),
          const Gap(20),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const BottomSheetWidget();
                },
              );
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => BottomSheetWidget()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff21244A)),
            child: const Text(
              'Add',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      )),
    );
  }
}
