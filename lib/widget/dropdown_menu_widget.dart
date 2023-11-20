import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/dropdown_controller.dart';

class DropdownMenuEXample extends StatelessWidget {
  DropdownMenuEXample({super.key});
  @override
  Widget build(BuildContext context) {
    final dropdownController = Get.put(DropdownController());
    return GetBuilder<DropdownController>(builder: (_) {
      return DropdownMenu<String>(
        hintText: 'Select',
        trailingIcon: Icon(Icons.arrow_drop_down_outlined),
        leadingIcon: Icon(Icons.calendar_month),
        width: 250,
        errorText: dropdownController.isOpen ? 'Error text' : null,
        onSelected: (String? value) {
          dropdownController.dropdownValue = value!;
        },
        dropdownMenuEntries: dropdownController.list
            .map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      );
    });
  }
}
