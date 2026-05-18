import 'package:flutter/material.dart';
import 'package:islamona/controller/remoteazkar.dart';
import 'package:islamona/veiw/akarespages/scaffolds.dart';

class Roqia extends StatefulWidget {
  const Roqia({Key? key}) : super(key: key);

  @override
  State<Roqia> createState() => _RoqiaState();
}

class _RoqiaState extends State<Roqia> {
  Remotejson remoteJson = Remotejson();
  List<dynamic>? items;
  Map<int, int> counts = {}; // Maintain counts for each item
  Map<int, bool> disabledItems = {}; // Maintain whether an item is disabled
  var roqia;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    items = await remoteJson.readJson();

    items!.forEach((element) {
      if (element["id"] == 5) {
        setState(() {
          roqia = element["array"];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyWidget(
      morningZkr: roqia,
      appBarTitle: "الرقية",
    );
  }
}
