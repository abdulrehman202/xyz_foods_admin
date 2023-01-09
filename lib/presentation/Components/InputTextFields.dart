import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xyz_foods_admin/presentation/resources/values_manager.dart';

import '../resources/color_manager.dart';

class InputTextField extends StatefulWidget {
  late String fieldName;
  late TextEditingController externalController;
  late bool notEditable;
  InputTextField(
      {required this.fieldName,
      required this.externalController,
      this.notEditable = false,
      super.key});

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  var backgroundCursorColor;
  var focusNode;
  var style;
  var controller;
  var cursorColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    style = const TextStyle();
    controller = widget.externalController;
    // TextEditingController();
    focusNode = FocusNode();
    backgroundCursorColor = ColorManager.primary;
    cursorColor = ColorManager.primary;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: AppSize.s60, child: Text(widget.fieldName)),
            const VerticalDivider(),
            Expanded(
              child: EditableText(
                readOnly: widget.notEditable,
                controller: controller,
                focusNode: focusNode,
                style: style,
                cursorColor: cursorColor,
                backgroundCursorColor: backgroundCursorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
