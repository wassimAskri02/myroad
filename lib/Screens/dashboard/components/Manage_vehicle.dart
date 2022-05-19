
import 'package:proje/responsive.dart';
import 'package:flutter/material.dart';
import 'package:proje/models/Vehicle.dart';
import '../../../../../constants.dart';

import 'package:proje/Screens/dashboard/components/vehicle_info_card.dart';

import '../../../controllers/add_vehicle.dart';
class ManageVehicle extends StatefulWidget {
static const String id="manage-item-screen";
   @override
  State<ManageVehicle> createState() => _ManageVehicleState();
}

class _ManageVehicleState extends State<ManageVehicle> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Vehicles",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            AddVehicle(),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 400 ? 2 : 4,
            childAspectRatio: _size.width < 400 ? 1.3 : 1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 800 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key key,
    this.crossAxisCount = 5,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
