import 'package:flutter/material.dart';
import 'package:xyz_foods_admin/domain/Temp.dart';
import 'package:xyz_foods_admin/presentation/Components/MenuCategoryCard.dart';
import 'package:xyz_foods_admin/presentation/resources/color_manager.dart';
import 'package:xyz_foods_admin/presentation/resources/values_manager.dart';

import '../resources/strings_manager.dart';

class SelectFoodCategory extends StatefulWidget {
  const SelectFoodCategory({super.key});

  @override
  State<SelectFoodCategory> createState() => _SelectFoodCategoryState();
}

class _SelectFoodCategoryState extends State<SelectFoodCategory> {
  late List<Temp> categoriesList, filteredList;

  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode();
    categoriesList = [
      Temp(AppStrings.burgerLink, AppStrings.burger),
      Temp(AppStrings.shawarmaLink, AppStrings.shawarma),
      Temp(AppStrings.parathaRollLink, AppStrings.parathaRoll),
      Temp(AppStrings.spinRollLink, AppStrings.spinRoll),
      Temp(AppStrings.friesLink, AppStrings.fries),
      Temp(AppStrings.pastaLink, AppStrings.pasta),
      Temp(AppStrings.pizzaLink, AppStrings.pizza),
      Temp(AppStrings.iceBarLink, AppStrings.iceBar),
      Temp(AppStrings.teaSectionLink, AppStrings.teaSection),
      Temp(AppStrings.coffeeLink, AppStrings.coffee),
    ];

    setState(() {
      filteredList = categoriesList;
    });
  }

  SearchBar() {
    return Container(
        margin: const EdgeInsets.all(AppMargin.m18),
        height: AppSize.s60,
        padding: const EdgeInsets.all(AppPadding.p14),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s16))),
        child: Center(
            child: EditableText(
          controller: controller,
          focusNode: focusNode,
          style: const TextStyle(color: Colors.black),
          backgroundCursorColor: Colors.black,
          cursorColor: Colors.black,
          autofocus: true,
          onChanged: (string) {
            Future.delayed(Duration.zero, () {
              controller.text = string;
              controller.selection =
                  TextSelection.collapsed(offset: controller.text.length);
              List<Temp> temp;

              temp = categoriesList
                  .where((c) =>
                      (c.category.toLowerCase().contains(string.toLowerCase())))
                  .toList();
              setState(() {
                filteredList = temp;
              });
            });
            focusNode.requestFocus();
          },
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s200,
              child: Center(
                child: SearchBar(),
              ),
            ),
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 6,
                scrollDirection: Axis.vertical,
                children: List.generate(filteredList.length, (index) {
                  return Expanded(
                    child: MenuCategoryCard(
                        filteredList[index].url, filteredList[index].category),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
