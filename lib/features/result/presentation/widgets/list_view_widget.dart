import 'package:flutter/material.dart';
import 'package:settings_app/core/constants/list_of_images.dart';

import '../../../../core/shared/widgets/custom_text_style.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listOfImages.length,
      itemBuilder: (BuildContext context, int index) {
        return listViewCard(
            listOfImages[index], 'title ${index + 1}', context);
      },
    );
  }
}

Widget listViewCard(String image, String title, BuildContext context) {
  return Card(
    child: Row(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        headLineText(
            data: title,
            color: Theme.of(context).primaryColor,
            size: 20,
            fontFamily: 'PlayfairDisplay'),
      ],
    ),
  );
}
