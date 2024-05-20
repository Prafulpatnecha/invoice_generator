import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../utils/globlevalues.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => genratepdf(),
      ),
    );
  }
}

// final logoimage=PdfImage.file(pdf.document, bytes: File('assets/image/logo.jpg').readAsBytesSync());
Future<Uint8List> genratepdf() {
final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) => pw.Container(
        child: pw.Column(
          children: [
            pw.SizedBox(
              height: 35,
            ),
            pw.Container(
              margin: const pw.EdgeInsets.symmetric(horizontal: 30),
              height: 68,
              width: double.infinity,
              // color: Colors.black12,
              // alignment: Alignment.center,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Customer',
                    style: const pw.TextStyle(
                        fontSize: 25, color: PdfColors.black),
                  ),
                  pw.Spacer(),
                  pw.SizedBox(
                      width: 162,
                      child: pw.Text(
                        invoice[selectindex].name,
                        textAlign: pw.TextAlign.center,
                        style:
                            const pw.TextStyle(fontSize: 25, color: PdfColors.black),
                      )),
                  pw.SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            pw.Container(
              margin: const pw.EdgeInsets.symmetric(horizontal: 30),
              child: pw.Divider(),
            ),
            pw.SizedBox(
              height: 25,
            ),
            pw.Align(
              child: pw.Text(
                'Invoice Items',
                style: pw.TextStyle(
                    color: PdfColors.black,
                    fontSize: 19,
                    fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.Container(
              margin:
                  const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('Technical Engagement'),
                      pw.SizedBox(width: 230),
                      pw.Text(
                        '120.00',
                        style: const pw.TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children:[
                  pw.Text('Deployment Assistance'),
                  pw.SizedBox(width: 230),
                  pw.Text(
                        '200.00',
                        style: const pw.TextStyle(fontSize: 13),
                      ),
                ]
              ),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children:[
                        pw.Text('Develop Software Solution'),
                        pw.SizedBox(width: 220),
                        pw.Text(
                            '${invoice[selectindex].price - 200 - 120 - 840}',
                          style: const pw.TextStyle(fontSize: 13),
                        ),
                      ]
                  ),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children:[
                        pw.Text('Produce Documentation'),
                        pw.SizedBox(width: 230),
                        pw.Text(
                          '840.00',
                          style: const pw.TextStyle(fontSize: 13),
                        ),
                      ]
                  ),
            pw.SizedBox(height: 100),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children:[
                        pw.Text(
                              'Total',
                              style: const pw.TextStyle(fontSize: 30, color: PdfColors.black),
                            ),
                        pw.SizedBox(width: 230),
                        pw.Text(
                              '${invoice[selectindex].price}',
                              style: const pw.TextStyle(fontSize: 30, color: PdfColors.black),
                            ),
                      ],
                  ),
                  pw.Container(
                    margin: const pw.EdgeInsets.symmetric(horizontal: 10),
                    child: pw.Divider(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
  return pdf.save();
}
