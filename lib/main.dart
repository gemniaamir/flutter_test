import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proctor/service/injection_container.dart';
import 'package:proctor/utils/routes.dart';
import 'package:proctor/utils/theme.dart';
import 'dependencies/dependencies.dart' as dep;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await dep.init();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeStyle(context);

    return GetMaterialApp(
      title: 'Flutter Interview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: TextTheme(
              titleLarge: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: GoogleFonts.openSans(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: GoogleFonts.openSans())),
      getPages: RoutesHelper.pages,
      initialRoute: RoutesHelper.dashboard,
    );
  }
}
