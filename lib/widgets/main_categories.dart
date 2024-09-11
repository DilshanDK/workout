import 'package:flutter/material.dart';
import 'package:myapp/util/colors.dart';

class MainCategories extends StatelessWidget {
  const MainCategories({super.key, required this.title, required this.imgName, required this.dec});

  final String title;
  final String dec;
  final String imgName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(66, 26, 25, 25),
            offset: Offset(0, 2),
            blurRadius: 5,
          )
        ],
        color: kCardBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 19,
                  color: kMainBlackColor,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/exercises/$imgName.png",
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
             Text(
              dec,
              style: const TextStyle(color: kGradientTopColor),
            ),
          ],
        ),
      ),
    );
  }
}
