import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import '../controller/dropdown_controller.dart';

class DropdownButtonFormfield extends StatelessWidget {
  DropdownButtonFormfield({super.key});
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final dropdownController = Get.put(DropdownController());
    return GetBuilder<DropdownController>(builder: (_) {
      return Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        hintText: 'Enter Your Full Name.',
                        hintStyle: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Container(
                      width: 350,
                      child: DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null) {
                            return 'Please select Value';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        hint: Text('Enter Your Value'),
                        isExpanded: true,
                        icon: Icon(Icons.arrow_downward_outlined),
                        elevation: 4,
                        value: dropdownController.dropdownValue,
                        onChanged: (String? newValue) {
                          dropdownController.dropdownValue = newValue!;
                        },
                        onSaved: (value) {
                          dropdownController.dropdownValue = value.toString();
                        },
                        items: <String>['Value1', 'Value2', 'Value3', 'Value4']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    //const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      child: const Text('Submit Button'),
                    ),
                  ])));
    });
  }
}
