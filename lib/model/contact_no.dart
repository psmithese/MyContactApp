import 'package:flutter/foundation.dart';
import 'package:mycontactapp/model/contact.dart';

class ContactProvider extends ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
