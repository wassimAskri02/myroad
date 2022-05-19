import 'package:proje/controllers/delete_vehicle.dart';
import 'package:proje/models/Vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../controllers/map_pop_up.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key key,
    this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
               child: MapPopUp(),
              ),
            DeleteVehicle(),
            ],
          ),
          Text(
            info.model,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
         Text(
            info.registration_number,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        
 
        ],
      ),
    );
  }
}