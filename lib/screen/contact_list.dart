import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mycontactapp/misc/style.dart';
import 'package:provider/provider.dart';

import '../model/contact.dart';
import '../model/contact_no.dart';
import 'home_screen.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  void _showAddContactBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddContactBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //  final contactListProvider = Provider.of<ContactProvider>(context);
    return Scaffold(
        body: Consumer<ContactProvider>(builder: (context, provider, child) {
      final contacts = provider.contacts;
      if (contacts.isEmpty) {
        return Center(
          child: ContactHomeScreen(),
        );
      } else {
        return SafeArea(
          child: Column(
            children: [
              ListTile(
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
              Gap(20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Contacts',
                      style: headStyle4,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff21244A)),
                        onPressed: () {
                          return _showAddContactBottomSheet(context);
                        },
                        child: Icon(Icons.add))
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final contact = contacts[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            side: BorderSide(
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                          child: Column(
                            children: [
                              FractionallySizedBox(
                                widthFactor: 1.0,
                                child: Container(
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xfffff4f4),
                                      border: Border.all(
                                          color: Color(0xffd9d9d9),
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          contact.name,
                                          style: headStyle4,
                                        ),
                                        Icon(Icons.more_vert),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Gap(8),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Row(
                                  children: [
                                    Icon(Icons.call_outlined),
                                    Gap(5),
                                    Text(
                                      contact.phoneNumber,
                                      style: headStyle2,
                                    ),
                                    Gap(10),
                                    Icon(Icons.mail_outline),
                                    Gap(5),
                                    Flexible(
                                      child: Text(
                                        contact.email, style: headStyle2,
                                        //overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Gap(8),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 26),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Flexible(
                                        child: Text(
                                      contact.location,
                                      style: headStyle2,
                                    ))
                                  ],
                                ),
                              ),
                              Gap(16)
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      }
    }));
  }
}

class AddContactBottomSheet extends StatefulWidget {
  @override
  _AddContactBottomSheetState createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _addContact(BuildContext context) {
    final contactListProvider =
        Provider.of<ContactProvider>(context, listen: false);

    final String name = _nameController.text;
    final String phoneNumber = _phoneController.text;
    final String location = _locationController.text;
    final String email = _emailController.text;

    if (name.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        location.isNotEmpty &&
        email.isNotEmpty) {
      contactListProvider
          .addContact(Contact(name, phoneNumber, location, email));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add Contact',
              style: headStyle1,
            ),
            Gap(20),
            Text(
              'Name',
              style: headStyle3,
            ),
            Gap(8),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            Gap(16),
            Text(
              'Phone',
              style: headStyle3,
            ),
            Gap(8),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: '+234',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            Gap(16),
            Text(
              'Email',
              style: headStyle3,
            ),
            Gap(8),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'example@email.com',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            Gap(16),
            Text(
              'Home Address',
              style: headStyle3,
            ),
            Gap(8),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Enter address of contact',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your contact address';
                }
                return null;
              },
            ),
            Gap(16),
            ElevatedButton(
              onPressed: () {
                return _addContact(context);
              },
              child: Text('Add Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
