import 'package:flutter/material.dart';
import 'package:myapp/data/user_data.dart';
import 'package:myapp/models/exercise_model.dart';
import 'package:myapp/util/colors.dart';
import 'package:myapp/widgets/add_exercise_card.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
    required this.exerciseList,
  });
  final List<Exercise> exerciseList;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final userData = user;
  final exseciseData = Exercise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, ${userData.fullName}",
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w700),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Lets Add Some Workouts and Equipment for today!",
                    style: TextStyle(
                        fontSize: 15,
                        color: kGradientBottomColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "All Exercises",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      Exercise exercise = widget.exerciseList[index];
                      return AddExerciseCard(
                        title: exercise.exerciseName,
                        imgUrl: exercise.exerciseImageUrl,
                        noOfMin: exercise.noOfMinuites,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
