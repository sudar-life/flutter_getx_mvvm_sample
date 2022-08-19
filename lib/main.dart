import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_sample/src/controller/home_controller.dart';
import 'package:flutter_getx_mvvm_sample/src/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
      home: const Home(),
    );
  }
}
