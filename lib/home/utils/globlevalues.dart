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