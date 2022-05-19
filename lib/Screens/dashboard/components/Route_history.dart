import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:proje/constants.dart';

class RouteHistory extends StatefulWidget {
  static const String id = "Route_history";
  @override
  State<RouteHistory> createState() => _RouteHistoryState();
}

class _RouteHistoryState extends State<RouteHistory> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2022, 11, 5), end: DateTime(2022, 12, 24));
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;

    return Container(
      alignment: Alignment.topLeft,
      width: 300,
      height: 150,
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'filter by date',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                child: Text(DateFormat('yyyy/MM/dd').format(start)),
                onPressed: pickDateRange,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Icon(Icons.arrow_right_alt, color: Colors.white54),
            SizedBox(
              width: 6,
            ),
            Expanded(
              child: ElevatedButton(
                child: Text(DateFormat('yyyy/MM/dd').format(end)),
                onPressed: pickDateRange,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Difference : ${difference.inDays} days',
          style: TextStyle(fontSize: 15),
        )
      ]),
    );
  }

  Future pickDateRange() async {
    DateTimeRange newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
}