import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/exercise_model.dart';
import 'package:myapp/util/colors.dart';
import 'package:myapp/widgets/main_categories.dart';

class CategoriesInfo extends StatefulWidget {
  const CategoriesInfo({
    super.key,
    required this.title,
    required this.dec,
    required this.exerciseList,
    required this.showEquipment,
  });

  final String title;
  final String dec;
  final List<Exercise> exerciseList;
  final bool showEquipment;

  @override
  State<CategoriesInfo> createState() => _CategoriesInfoState();
}

class _CategoriesInfoState extends State<CategoriesInfo> {
  String formattedDate = DateFormat('EEEE, MMM').format(DateTime.now());
  String formattedDay = DateFormat('dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
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
              widget.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.dec,
                style: const TextStyle(color: kSubtitleColor),
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
              
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 9/9.5,
                ),
                itemCount: widget.exerciseList.length,
                itemBuilder: (context, index) {
                  Exercise exercise = widget.exerciseList[index];
                  return MainCategories(
                      title: exercise.exerciseName,
                      dec: "${exercise.noOfMinuites.toString()} of Workouts",
                      imgUrl: exercise.exerciseImageUrl);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
