import 'package:proje/controllers/add_person.dart';
import 'package:proje/controllers/delete_person.dart';
import 'package:proje/controllers/map_pop_up.dart';
import 'package:proje/models/Person.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class ManagePerson extends StatelessWidget {
  static const String id="person-manage";

  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Persons",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            AddPerson()
          ],
        ),
          SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("  Full Name",style: TextStyle(
                        color: Color(0xFF2697FF), fontWeight: FontWeight.bold),),
                ),
                DataColumn(
                  label: Text("CIN",style: TextStyle(
                        color: Color(0xFF2697FF), fontWeight: FontWeight.bold),),
                ),
                DataColumn(
                  label: Text("Phone number",style: TextStyle(
                        color: Color(0xFF2697FF), fontWeight: FontWeight.bold),),
                ),
             DataColumn(
                  label: Text("     ",style: TextStyle(
                        color: Color(0xFF2697FF), fontWeight: FontWeight.bold),),
                ),
                 DataColumn(
                  label: Text("     ",style: TextStyle(
                        color: Color(0xFF2697FF), fontWeight: FontWeight.bold),),
                ),
              ],
              
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoRecentFiles[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.name),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.cin)),
      DataCell(Text(fileInfo.number)),
      DataCell(DeletePerson(),),
       DataCell(MapPopUp()),
    ],
  );
}
