import 'package:auto_size_text/auto_size_text.dart';
import 'package:bandspicker/utils/styles.dart';
import 'package:flutter/material.dart';

import 'images.dart';

class GridViewCustoms extends StatelessWidget {
  final Image image;
  final String title;
  Function onTab;

  GridViewCustoms(
      {Key? key, required this.image, required this.title, required this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => onTab()));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                offset: Offset(2, 2),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: image),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: LatoRegular.copyWith(
                          fontSize: 22, overflow: TextOverflow.fade),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
