import 'package:flutter/material.dart';
import 'package:xyz_foods_admin/presentation/resources/color_manager.dart';
import 'package:xyz_foods_admin/presentation/resources/routes_manager.dart';
import 'package:xyz_foods_admin/presentation/resources/values_manager.dart';

class MenuCategoryCard extends StatefulWidget {
  final String path, category;
  const MenuCategoryCard(this.path, this.category, {super.key});

  @override
  State<MenuCategoryCard> createState() => _MenuCategoryCardState();
}

class _MenuCategoryCardState extends State<MenuCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.addFoodItemRoute, arguments: {
          'imgPath': widget.path,
          'categoryName': widget.category
        });
      },
      child: Container(
        margin: const EdgeInsets.all(AppMargin.m18),
        child: Card(
          elevation: 2,
          shadowColor: ColorManager.primaryOpacity70,
          child: Container(
            margin: const EdgeInsets.all(AppMargin.m12),
            padding: const EdgeInsets.all(AppPadding.p8),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: constraints.maxHeight * 0.6,
                        width: constraints.maxWidth,
                        child: Image.network(
                          widget
                              .path, //'https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.fill,
                        )),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          direction: Axis.vertical,
                          children: [
                            Text(
                              widget.category,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]);
            }),
          ),
        ),
      ),
    );
  }
}
