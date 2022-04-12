import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final IconData icon;
  const MenuItem({required this.text, required this.icon});
}

class MenuItems {
  static const List<MenuItem> itemsFirst = [
    itemRefer,
    itemContact,
    itemSettings,
  ];

  static const List<MenuItem> itemsSecond = [
    itemLogout,
  ];

  static const itemRefer = MenuItem(text: 'Refer', icon: Icons.share);
  static const itemContact =
      MenuItem(text: 'Contact Us', icon: Icons.contact_page);
  static const itemSettings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const itemLogout = MenuItem(text: 'LogOut', icon: Icons.logout);
}
