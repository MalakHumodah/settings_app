import 'package:flutter/material.dart';

import '../../../../core/constants/list_of_images.dart';
import '../../../../core/shared/widgets/custom_text_style.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: listOfImages.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return gridViewCard(
            listOfImages[index], 'title ${index + 1}', context);
      },
    );
  }
}

Widget gridViewCard(String image, String title, BuildContext context) {
  return Card(
    child: Column(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        headLineText(
          data: title,
          color: Theme.of(context).primaryColor,
          size: 20,
          fontFamily: 'PlayfairDisplay'
        ),
      ],
    ),
  );
}
