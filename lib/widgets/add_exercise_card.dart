import 'package:flutter/material.dart';
import 'package:myapp/util/colors.dart';

class AddExerciseCard extends StatelessWidget {
  const AddExerciseCard(
      {super.key,
      required this.title,
      required this.imgUrl,
      required this.noOfMin});

  final String title;
  final String imgUrl;
  final int noOfMin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: kCardBackgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(title),
          Image.asset(
            imgUrl,
            width: 100,
          ),
          Text(noOfMin.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 207, 204, 204),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 30,
                      color: kGradientBottomColor,
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 207, 204, 204),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: kMainPinkColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
