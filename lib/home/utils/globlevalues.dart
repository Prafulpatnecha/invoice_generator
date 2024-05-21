import 'package:flutter/cupertino.dart';

int selectindex=0;
List invoice=[
  InvoiceModel(name: 'David Thomas',price: 4180.95,product: 'Create and deploy software package'),
  InvoiceModel(name: 'Michael Ambiguous',price: 1930.55,product: 'Provide remote support after lunch'),
  InvoiceModel(name: 'Marty McDanceFace',price: 2560.00,product: 'Create software to teach robots how to dance'),
];
class InvoiceModel
{
  String? name;
  String? product;
  double? price;
  InvoiceModel({this.name,this.product,this.price});
}
AssetImage logoimage=const AssetImage('assets/image/logo.jpg');

List invoiceList=[
  IinvoiceModel(itemName: 'Technical Engagement',price: 120.00),
  IinvoiceModel(itemName: 'Deployment Assistance',price: 200.00),
  IinvoiceModel(itemName: 'Develop Software Solution',price: value),
  IinvoiceModel(itemName: 'Produce Documentation',price: 840.00),
];
List invoiceListlast=[
  IinvoiceModel(itemName: 'Account Number',details: '1234 1234'),
  IinvoiceModel(itemName: 'Account Name',details: 'ADAM FAMILY TRUST'),
  IinvoiceModel(itemName: 'Total Amount to be Paid',price: value),
];

class IinvoiceModel
{
  String? itemName;
  double? price;
  String? details;
  IinvoiceModel({this.itemName,this.price,this.details});
}
double value=0;