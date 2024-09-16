import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/data/equipment_data.dart';
import 'package:myapp/data/exercise_data.dart';
import 'package:myapp/data/user_data.dart';
import 'package:myapp/pagers/categories_info.dart';
import 'package:myapp/pagers/equipment_page.dart';
import 'package:myapp/util/colors.dart';
import 'package:myapp/widgets/main_categories.dart';
import 'package:myapp/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DateFormat formatter = DateFormat('EEEE, MMMM');
  final DateFormat dayFormatter = DateFormat('dd');

  String formattedDate = DateFormat('EEEE, MMM').format(DateTime.now());
  String formattedDay = DateFormat('dd').format(DateTime.now());

  final exerciseData = ExerciseData();
  final equipmentData = EquipmentData();

  @override
  Widget build(BuildContext context) {
    final userData = user;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$formattedDate $formattedDay",
              style: const TextStyle(fontSize: 12, color: kSubtitleColor),
            ),
            Text(
              "Hello, ${userData.fullName}",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressCard(pValue: userData.calculateTotalCaloriesBurned()),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  "Today's Activity",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesInfo(
                            title: "Warmups",
                            exerciseList: exerciseData.exerciseList,
                            dec:
                                "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                            showEquipment: false,
                          ),
                        ),
                      );
                    },
                    child: const MainCategories(
                        title: "Warmup",
                        dec: "See More...",
                        imgUrl: "assets/images/exercises/cobra.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EquipmentPage(
                              title: "Equipments",
                              dec: "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              equipmentList: equipmentData.equipmentList,
                              imgUrl: "imgUrl",
                              noOfMinuites: 5,
                              noOfCaloriesBurned: 9),
                        ),
                      );
                    },
                    child: const MainCategories(
                        title: "Equipment",
                        dec: "See More...",
                        imgUrl: "assets/images/equipments/dumbbells2.png"),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  CategoriesInfo(
                            title: 'Exercises',
                            dec:
                                "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                            exerciseList: exerciseData.exerciseList,
                            showEquipment: false,
                          ),
                        ),
                      );
                    },
                    child: const MainCategories(
                      title: "Exercise",
                      dec: "See More...",
                      imgUrl: 'assets/images/exercises/dragging.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  CategoriesInfo(
                            title: 'Stretching',
                            dec:
                                "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                            exerciseList: exerciseData.exerciseList,
                            showEquipment: false,
                          ),
                        ),
                      );
                    },
                    child: const MainCategories(
                        title: "Stretching",
                        dec: "See More...",
                        imgUrl: "assets/images/exercises/yoga.png"),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
