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
Future<Uint8List> genratepdf() async {
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
  final imagefind = await imageFromAssetBundle('assets/image/logo.jpg');
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        children: [
          pw.SizedBox(
            height: 10,
          ),
          pw.Row(
            children: [
              pw.Text(
                  'Attention to: ${invoice[selectindex].name}\n123 Fake St\nBermuda Triangle'),
              pw.Spacer(),
              pw.Container(
                height: 75,
                width: 110,
                child: pw.Image(imagefind, fit: pw.BoxFit.cover),
              )
            ],
          ),
          pw.SizedBox(
            height: 50,
          ),
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.black),
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(20),
                    child: pw.Text('INVOICE FOR PAYMENT',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.SizedBox(width: 150)
                ],
              ),
              ...List.generate(
                invoiceList.length,
                (index) => pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Text(invoiceList[index].itemName.toString()),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Text('\$${invoiceList[index].price}'),
                    ),
                  ],
                ),
              ),
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Text('TEX', textAlign: pw.TextAlign.end),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Text('\$418.10'),
                  ),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Text('TOTAL', textAlign: pw.TextAlign.end),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Text('\$${invoice[selectindex].price + 418.10}'),
                  ),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 30),
          pw.Text(
            'THANK YOU FOR YOUR BUSINESS!',
            textAlign: pw.TextAlign.center,
            style: const pw.TextStyle(fontSize: 17.5,),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            'Please forward the below slip to your accounts payable department',
            textAlign: pw.TextAlign.center,
            style: const pw.TextStyle(fontSize: 11),
          ),
          pw.Divider(),
          pw.SizedBox(height: 30),
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.black),
           children: [

          ...List.generate(
            invoiceListlast.length,
                (index) => pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(10),
                  child: pw.Text(invoiceListlast[index].itemName.toString()),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(10),
                  child: pw.Text('\$${(index!=2)?invoiceListlast[index].details:invoiceListlast[index].price}'),
                ),
              ],
            ),
          ),
           ],
          ),
            pw.SizedBox(height: 30),
          pw.Text(
            'Please ensure all checks are payable to the ADAM FAMILY\nTRUST',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold),
          ),
        ],
      ),
    ),
  );
  return pdf.save();
}
