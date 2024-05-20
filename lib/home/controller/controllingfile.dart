import 'package:flutter/material.dart';
import 'package:invoice_generator/home/controller/routes.dart';

class MyPdfApp extends StatelessWidget {
  const MyPdfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
