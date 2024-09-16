import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/equipment_model.dart';
import 'package:myapp/util/colors.dart';
import 'package:myapp/widgets/equipment_details_card.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({
    super.key,
    required this.title,
    required this.dec,
    required this.equipmentList,
    required this.imgUrl,
    required this.noOfMinuites,
    required this.noOfCaloriesBurned,
  });

  final String title;
  final String dec;
  final String imgUrl;
  final int noOfMinuites;
  final int noOfCaloriesBurned;

  final List<Equipment> equipmentList;


  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                widget.dec,
                style: const TextStyle(color: kSubtitleColor),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 15,
                  childAspectRatio: 16/10,
                ),
                itemCount: widget.equipmentList.length,
                itemBuilder: (context, index) {
                  Equipment equipment = widget.equipmentList[index];
                  return  EquipmentDetailsCard(
                    title: equipment.equipmentName,
                    dec: equipment.equipmentDescription,
                    imgUrl: equipment.equipmentImageUrl,
                    noOfMin: equipment.noOfMinuites,
                    noOfCalories: equipment.noOfCalories,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
