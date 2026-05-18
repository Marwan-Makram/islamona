import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:islamona/veiw/mainpages/Azkarpage.dart';
import 'package:islamona/veiw/mainpages/PrayerTimesView.dart';
import 'package:islamona/veiw/mainpages/tasbih.dart';


class HomePge extends StatefulWidget {
  const HomePge({Key? key}) : super(key: key);

  @override
  State<HomePge> createState() => _HomePgeState();
}

class _HomePgeState extends State<HomePge> {
  int currentpage = 0;
  String appBarTitle = 'مواقيت الصلاة';

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController(initialPage: currentpage);

    void onTapIcon(int index) {
      _controller.animateToPage(index,
          duration: Duration(microseconds: 300), curve: Curves.easeIn);
      // if (index == 0) {
      //   appBarTitle = 'مواقيت الصلاة';
      // } else if (index == 1) {
      //   appBarTitle = "الأذكار";
      // } else if (index == 2) {
      //   appBarTitle = "تسبيح";
      // }
    }

    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              currentpage = value;
            });
          },
          children: [
            PrayerTimesScreen(),
            azkarpagen(),
            Tasbeeh(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 10,
            selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 20),
            selectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green, // Change the selected label color here
            ),
            elevation: 0,
            backgroundColor: Colors.blueGrey[800],
            currentIndex: currentpage, // Use the currentpage variable here
            onTap: onTapIcon,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  FlutterIslamicIcons.mosque,
                  color: Colors.green,
                  size: 30,
                ),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FlutterIslamicIcons.quran2,
                  color: Colors.green,
                  size: 30,
                ),
                label: 'الأذكار',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    color: Colors.green, FlutterIslamicIcons.tasbihHand, size: 30),
                label: 'تسبيح',
              ),
            ],
            ),
       );
   }
}
