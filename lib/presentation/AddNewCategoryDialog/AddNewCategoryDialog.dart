import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xyz_foods_admin/presentation/Components/InputTextFields.dart';
import 'package:xyz_foods_admin/presentation/resources/values_manager.dart';

class AddNewCategoryDialog extends StatelessWidget {
  const AddNewCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var _externalController = TextEditingController();
    return SimpleDialog(
      title: Text('Add new Category'),
      children: [
        InputTextField(
            fieldName: 'Name: ', externalController: _externalController),
        Container(
            margin: const EdgeInsets.all(AppMargin.m12),
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Submit')))
      ],
    );
  }
}
