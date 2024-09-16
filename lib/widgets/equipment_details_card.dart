import 'package:flutter/material.dart';
import 'package:myapp/util/colors.dart';

class EquipmentDetailsCard extends StatelessWidget {
  const EquipmentDetailsCard({
    super.key,
    required this.title,
    required this.dec,
    required this.imgUrl,
    required this.noOfMin,
    required this.noOfCalories,
  });

  final String title;
  final String dec;
  final String imgUrl;
  final int noOfMin;
  final double noOfCalories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kCardBackgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(66, 26, 25, 25),
              offset: Offset(0, 2),
              blurRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    imgUrl,
                    width: 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$noOfMin Mins of workout.",
                        style: const TextStyle(
                            color: kGradientBottomColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text("$noOfCalories Calories will burn.",style: const TextStyle(
                            color: kGradientBottomColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(dec,
                  style: const TextStyle(
                      color: kSubtitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}
