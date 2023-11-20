import 'package:flutter/material.dart';
import '../widget/dropdownbutton_widget.dart';
import '../widget/dropdown_menu_widget.dart';

class DropdownApp extends StatelessWidget {
  const DropdownApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DropdownMenu')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButtonFormfield(),
              DropdownMenuEXample()],
          ),
        ),
      ),
    );
  }
}
