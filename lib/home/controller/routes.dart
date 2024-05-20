import 'package:flutter/material.dart';
import 'package:invoice_generator/home/homepage/billscreen.dart';
import 'package:invoice_generator/home/homepage/homescreen.dart';

import '../homepage/pdfscreen.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes={
    '/':(context)=>const HomePage(),
    '/bill':(context)=>const BillingScreen(),
    '/pdf':(context)=>const PdfScreen(),
  };
}