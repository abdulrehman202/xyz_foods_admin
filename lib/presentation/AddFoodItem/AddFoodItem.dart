import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xyz_foods_admin/presentation/Components/InputTextFields.dart';
import 'package:xyz_foods_admin/presentation/resources/assets_manager.dart';
import 'package:xyz_foods_admin/presentation/resources/color_manager.dart';
import 'package:xyz_foods_admin/presentation/resources/values_manager.dart';

class AddFoodItem extends StatefulWidget {
  const AddFoodItem({super.key});

  @override
  State<AddFoodItem> createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  late InputTextField inputCategory, inputName, inputPrice;
  late TextEditingController inputCategoryController,
      inputNameController,
      inputPriceController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    inputCategoryController = TextEditingController();
    inputNameController = TextEditingController();
    inputPriceController = TextEditingController();

    inputCategory = InputTextField(
      fieldName: 'Category',
      externalController: inputCategoryController,
      notEditable: true,
    );
    inputName = InputTextField(
      fieldName: 'Name',
      externalController: inputNameController,
    );
    inputPrice = InputTextField(
      fieldName: 'Price',
      externalController: inputPriceController,
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    inputCategoryController.text = arguments['categoryName'];

    return Scaffold(
        backgroundColor: ColorManager.primaryOpacity70,
        body: Row(children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Image.network(
              'https://healthwire.pk/wp-content/uploads/2022/04/disadvantages-of-fast-food.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.s20))),
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: const Image(
                        image: AssetImage(ImagePath.splashLogo),
                      ),
                    ),
                    inputCategory,
                    inputName,
                    inputPrice,
                    Container(
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.all(AppMargin.m12),
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('Add dish')))
                  ],
                ),
              ),
            ],
          ))
        ]));
  }
}
