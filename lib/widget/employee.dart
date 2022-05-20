import 'package:flutter/material.dart';
import 'package:pozo/color.dart';
import 'package:pozo/screen/taskdetail_Screen.dart';

GestureDetector employeeCard(context, index, employeeInfo) {
  int taskNumber = employeeInfo[index]['task'].length;

  return GestureDetector(
    child: Card(
      margin: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
      color: darkBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 20, 0, 0),
            child: Text(
              taskNumber.toString() + " tasks",
              style: const TextStyle(
                  color: white, fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 60.0, 10, 0),
            child: Text(
              employeeInfo[index]['title'],
              style: const TextStyle(
                  color: white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 70, 0, 0),
            child: Text(
              employeeInfo[index]['name'],
              style: const TextStyle(
                  color: white, fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    ),
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => TaskDetails(
          employeeDetails: employeeInfo[index],
        ),
      ),
    ),
  );
}
