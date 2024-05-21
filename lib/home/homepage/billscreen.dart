import 'package:flutter/material.dart';
import 'package:invoice_generator/home/utils/globlevalues.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          'Create and deploy software ...',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 68,
            width: double.infinity,
            // color: Colors.black12,
            // alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Customer',
                  style: TextStyle(fontSize: 25, color: Colors.black87),
                ),
                const Spacer(),
                SizedBox(
                    width: 162,
                    child: Text(
                      invoice[selectindex].name,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 25, color: Colors.black45),
                    )),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: const Divider(),
          ),
          const SizedBox(
            height: 25,
          ),
          const Align(
            child: Text(
              'Invoice Items',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const ListTile(
                  title: Text('Technical Engagement'),
                  trailing: Text(
                    '120.00',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                const ListTile(
                  title: Text('Deployment Assistance'),
                  trailing: Text(
                    '200.00',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                ListTile(
                  title: const Text('Develop Software Solution'),
                  trailing: Text(
                    '${invoice[selectindex].price - 200 - 120 - 840}',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                const ListTile(
                  title: Text('Produce Documentation'),
                  trailing: Text(
                    '840.00',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Total',
                    style: TextStyle(fontSize: 30, color: Colors.black45),
                  ),
                  trailing: Text(
                    '${invoice[selectindex].price}',
                    style: const TextStyle(fontSize: 30, color: Colors.black45),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Divider(),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            value=0;
            invoiceListlast[2].price=0;
            value=invoice[selectindex].price - 200 - 120 - 840;
            invoiceList[2].price=value;
            invoiceListlast[2].price=invoice[selectindex].price+418.10;
          });
          Navigator.of(context).pushNamed('/pdf');
        },
        child: const Icon(Icons.picture_as_pdf),
      ),
    );
  }
}