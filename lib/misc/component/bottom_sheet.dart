import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mycontactapp/misc/style.dart';
import 'package:mycontactapp/model/contact.dart';
import 'package:mycontactapp/model/contact_no.dart';
import 'package:provider/provider.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _emailController.dispose();

    super.dispose();
  }

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
      contactListProvider.addContact(Contact(
        name,
        phoneNumber,
        location,
        email,
      ));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (BuildContext context) {
        return SizedBox(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                          backgroundColor: const Color(0xff21244A)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final contact = Contact(
                            _nameController.text,
                            _phoneController.text,
                            _locationController.text,
                            _emailController.text,
                          );
                          Provider.of<ContactProvider>(
                            context,
                            listen: false,
                          ).addContact(contact);
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Add Contact'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      onClosing: () {},
    );
  }
}












// import 'package:flutter/material.dart';

// class FarmerForm extends StatefulWidget {
//   const FarmerForm({super.key});

//   @override
//   _FarmerFormState createState() => _FarmerFormState();
// }

// class _FarmerFormState extends State<FarmerForm> {
//   String? _selectedCrop;

//   final List<String> _crops = [
//     'Wheat',
//     'Corn',
//     'Soybean',
//     'Rice',
//     'Barley',
//     'Oat',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Farmer Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               DropdownButtonFormField<String>(
//                 value: _selectedCrop,
//                 items: _crops.map((crop) {
//                   return DropdownMenuItem<String>(
//                     value: crop,
//                     child: Text(crop),
//                   );
//                 }).toList(),
//                 decoration: const InputDecoration(
//                   labelText: 'Select Crop',
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedCrop = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Submit form
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
