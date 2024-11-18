import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.brownColor,
    );
  }
}
