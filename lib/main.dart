import 'package:bandspicker/State%20Management/Provider/featuredprovider.dart';
import 'package:bandspicker/State%20Management/Provider/popularprovider.dart';
import 'package:bandspicker/screen/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<FeaturedProvider>(create: (change) => FeaturedProvider()),
      ChangeNotifierProvider<PopularProvider>(create: (change) => PopularProvider()),
    ],
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationBarDemo(),
    );
  }
}
