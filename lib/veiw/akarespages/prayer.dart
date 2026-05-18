import 'package:flutter/material.dart';
import 'package:islamona/controller/remoteazkar.dart';
import 'package:islamona/veiw/akarespages/scaffolds.dart';

class Prayerazkar extends StatefulWidget {
  const Prayerazkar({super.key});

  @override
  State<Prayerazkar> createState() => _PrayerazkarState();
}

class _PrayerazkarState extends State<Prayerazkar> {
  Remotejson remoteJson = Remotejson();

  List<dynamic>? items;
  var prayerzkr;
  Map<int, int> counts = {}; // Maintain counts for each item
  Map<int, bool> disabledItems = {}; // Maintain whether an item is disabled
  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    items = await remoteJson.readJson();

    items!.forEach((element) {
      if (element["id"] == 3) {
        setState(() {
          prayerzkr = element["array"];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyWidget(
      morningZkr: prayerzkr,
      appBarTitle: "أذكار بعد الصلاة",
    );
  }
}
