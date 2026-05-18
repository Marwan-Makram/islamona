import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamona/veiw/mainpages/homepage1.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
void main() {
  runApp(const MyApp());
  tz.initializeTimeZones();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'), // Arabic
      ],
      debugShowCheckedModeBanner: false,
      title: 'Tzkrah',
      theme: ThemeData(
        fontFamily: "Tajawal",
        backgroundColor: Colors.blueGrey[900],
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // home: MyHomePage(),
      // home: azkarpagen(),
      // home: MornAzkar(),
      home: Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        // child: HomePge(),
        child: HomePge(),
      ),
    );
  }
}
