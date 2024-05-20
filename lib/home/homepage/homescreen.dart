import 'package:flutter/material.dart';
import 'package:invoice_generator/home/utils/globlevalues.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Invoices',style: TextStyle(color: Colors.white),),
      ),
      body:Column(
        children: [
          ...List.generate(invoice.length, (index) => TextButton(
            onPressed: () {
              setState(() {
                selectindex=index;
                Navigator.of(context).pushNamed('/bill');
              });
            },
            child: ListTile(
              trailing: Text('\$${invoice[index].price}',style: const TextStyle(fontSize: 15,),),
              subtitle: Text(invoice[index].name,style: const TextStyle(color: Colors.black45),),
              title: Text(invoice[index].name,style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),),
        ],
      ),
    );
  }
}
